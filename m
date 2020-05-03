Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D43B1C2B5A
	for <lists+linux-usb@lfdr.de>; Sun,  3 May 2020 12:30:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727985AbgECKaF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 3 May 2020 06:30:05 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:51618 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727892AbgECKaE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 3 May 2020 06:30:04 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 9B74F2001F;
        Sun,  3 May 2020 12:30:01 +0200 (CEST)
Date:   Sun, 3 May 2020 12:29:59 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Cc:     dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 07/10] drm/format-helper: Add drm_fb_swab()
Message-ID: <20200503102959.GA17117@ravnborg.org>
References: <20200429124830.27475-1-noralf@tronnes.org>
 <20200429124830.27475-8-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200429124830.27475-8-noralf@tronnes.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=ULXz4hXy c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=8nJEP1OIZ-IA:10 a=SJz97ENfAAAA:8 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8
        a=DG57d2mIFj9uljerWwkA:9 a=wPNLvfGTeEIA:10 a=vFet0B0WnEQeilDPIY6i:22
        a=E9Po1WZjFZOl8hwRPBS3:22 a=Vxmtnl_E_bksehYqCbjh:22
        a=pHzHmUro8NiASowvMSCR:22 a=6VlIyEUom7LUIeUMNQJH:22
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Noralf

On Wed, Apr 29, 2020 at 02:48:27PM +0200, Noralf Trønnes wrote:
> This replaces drm_fb_swab16() with drm_fb_swab() supporting 16 and 32-bit.
> Also make pixel line caching optional.
> 
> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
A couple of nits, with these considered:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  drivers/gpu/drm/drm_format_helper.c | 61 +++++++++++++++++++----------
>  drivers/gpu/drm/drm_mipi_dbi.c      |  2 +-
>  include/drm/drm_format_helper.h     |  4 +-
>  3 files changed, 44 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
> index 0897cb9aeaff..5c147c49668c 100644
> --- a/drivers/gpu/drm/drm_format_helper.c
> +++ b/drivers/gpu/drm/drm_format_helper.c
> @@ -79,39 +79,60 @@ void drm_fb_memcpy_dstclip(void __iomem *dst, void *vaddr,
>  EXPORT_SYMBOL(drm_fb_memcpy_dstclip);
>  
>  /**
> - * drm_fb_swab16 - Swap bytes into clip buffer
> - * @dst: RGB565 destination buffer
> - * @vaddr: RGB565 source buffer
> + * drm_fb_swab - Swap bytes into clip buffer
> + * @dst: Destination buffer
> + * @src: Source buffer
>   * @fb: DRM framebuffer
>   * @clip: Clip rectangle area to copy
> + * @cached: Source buffer is mapped cached (eg. not write-combined)
> + *
> + * If @cached is false a temporary buffer is used to cache one pixel line at a
> + * time to speed up slow uncached reads.
> + *
> + * This function does not apply clipping on dst, i.e. the destination
> + * is a small buffer containing the clip rect only.
>   */
> -void drm_fb_swab16(u16 *dst, void *vaddr, struct drm_framebuffer *fb,
> -		   struct drm_rect *clip)
> +void drm_fb_swab(void *dst, void *src, struct drm_framebuffer *fb,
> +		 struct drm_rect *clip, bool cached)
>  {
> -	size_t len = (clip->x2 - clip->x1) * sizeof(u16);
> +	u8 cpp = fb->format->cpp[0];
Use of format->cpp is deprecated, should be char_per_block according to
the comment in drm_fourcc.h

> +	size_t len = drm_rect_width(clip) * cpp;
> +	u16 *src16, *dst16 = dst;
> +	u32 *src32, *dst32 = dst;
>  	unsigned int x, y;
> -	u16 *src, *buf;
> +	void *buf = NULL;
>  
> -	/*
> -	 * The cma memory is write-combined so reads are uncached.
> -	 * Speed up by fetching one line at a time.
> -	 */
> -	buf = kmalloc(len, GFP_KERNEL);
> -	if (!buf)
> +	if (WARN_ON_ONCE(cpp == 1))
>  		return;
Or cpp != 2 && cpp != 4?
>  
> +	if (!cached)
> +		buf = kmalloc(len, GFP_KERNEL);
> +
> +	src += clip_offset(clip, fb->pitches[0], cpp);
Good that drm_rect_width() and clip_offset() are used,
replacing open-coded variants.

> +
>  	for (y = clip->y1; y < clip->y2; y++) {
> -		src = vaddr + (y * fb->pitches[0]);
> -		src += clip->x1;
> -		memcpy(buf, src, len);
> -		src = buf;
> -		for (x = clip->x1; x < clip->x2; x++)
> -			*dst++ = swab16(*src++);
> +		if (buf) {
> +			memcpy(buf, src, len);
> +			src16 = buf;
> +			src32 = buf;
> +		} else {
> +			src16 = src;
> +			src32 = src;
> +		}
> +
> +		for (x = clip->x1; x < clip->x2; x++) {
> +			if (cpp == 4)
> +				*dst32++ = swab32(*src32++);
> +			else
> +				*dst16++ = swab16(*src16++);
> +		}
> +
> +		src += fb->pitches[0];
>  	}
>  
>  	kfree(buf);
>  }
> -EXPORT_SYMBOL(drm_fb_swab16);
> +EXPORT_SYMBOL(drm_fb_swab);
>  
>  static void drm_fb_xrgb8888_to_rgb565_line(u16 *dbuf, u32 *sbuf,
>  					   unsigned int pixels,
> diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
> index 16bff1be4b8a..bfefbcb69287 100644
> --- a/drivers/gpu/drm/drm_mipi_dbi.c
> +++ b/drivers/gpu/drm/drm_mipi_dbi.c
> @@ -217,7 +217,7 @@ int mipi_dbi_buf_copy(void *dst, struct drm_framebuffer *fb,
>  	switch (fb->format->format) {
>  	case DRM_FORMAT_RGB565:
>  		if (swap)
> -			drm_fb_swab16(dst, src, fb, clip);
> +			drm_fb_swab(dst, src, fb, clip, !import_attach);
>  		else
>  			drm_fb_memcpy(dst, src, fb, clip);
>  		break;
> diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
> index ac220aa1a245..5f9e37032468 100644
> --- a/include/drm/drm_format_helper.h
> +++ b/include/drm/drm_format_helper.h
> @@ -14,8 +14,8 @@ void drm_fb_memcpy(void *dst, void *vaddr, struct drm_framebuffer *fb,
>  void drm_fb_memcpy_dstclip(void __iomem *dst, void *vaddr,
>  			   struct drm_framebuffer *fb,
>  			   struct drm_rect *clip);
> -void drm_fb_swab16(u16 *dst, void *vaddr, struct drm_framebuffer *fb,
> -		   struct drm_rect *clip);
> +void drm_fb_swab(void *dst, void *src, struct drm_framebuffer *fb,
> +		 struct drm_rect *clip, bool cached);
>  void drm_fb_xrgb8888_to_rgb565(void *dst, void *vaddr,
>  			       struct drm_framebuffer *fb,
>  			       struct drm_rect *clip, bool swab);
> -- 
> 2.23.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
