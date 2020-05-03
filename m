Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F9121C2CD1
	for <lists+linux-usb@lfdr.de>; Sun,  3 May 2020 15:38:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728622AbgECNis (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 3 May 2020 09:38:48 -0400
Received: from smtp.domeneshop.no ([194.63.252.55]:38933 "EHLO
        smtp.domeneshop.no" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728582AbgECNis (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 3 May 2020 09:38:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
        ; s=ds201912; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=LwqDvUwwp1e3yLi2gQ5RHgo3muJ414vIaU96DdbwfeQ=; b=ccxEoxGDrXp932KZIObS1AUTaw
        yQs6yL0T3X3ZOZrj6gkUuvWg8F1446U3YGgt8JNi68/QZsRC2FzjgjAI4AyJ+6gFGSgEa5MZHKg3v
        e7yS+4zWjpes8Wlb+vQ6c+Iu6jkEI8G9uVBOukX7Nfok01g0Nnu8gmW3qXCRV1TDN8j3CVVohkVIm
        RWqMsRvhP89cwxIvo4HwJ8JCBs2fmeS681Ka7FGivHgJWbm14+b/tjuG28TOqX6IaDWIVAWHEq3zw
        e5+eGwiUVW6x+OhNzpdyPMGN6HqNdCMXi9wXpBcDdxdVbIulOG58MFI1kdKHP4xNfyOTcIcpGa4Lu
        DLo7yIbQ==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:55643 helo=[192.168.10.61])
        by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <noralf@tronnes.org>)
        id 1jVEpR-0007ZY-MQ; Sun, 03 May 2020 15:38:45 +0200
Subject: Re: [PATCH 07/10] drm/format-helper: Add drm_fb_swab()
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org
References: <20200429124830.27475-1-noralf@tronnes.org>
 <20200429124830.27475-8-noralf@tronnes.org>
 <20200503102959.GA17117@ravnborg.org>
From:   =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <1fbe4cb0-65a1-0573-8958-6db49c1c1dc9@tronnes.org>
Date:   Sun, 3 May 2020 15:38:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200503102959.GA17117@ravnborg.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



Den 03.05.2020 12.29, skrev Sam Ravnborg:
> Hi Noralf
> 
> On Wed, Apr 29, 2020 at 02:48:27PM +0200, Noralf Trønnes wrote:
>> This replaces drm_fb_swab16() with drm_fb_swab() supporting 16 and 32-bit.
>> Also make pixel line caching optional.
>>
>> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
> A couple of nits, with these considered:
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> 
>> ---
>>  drivers/gpu/drm/drm_format_helper.c | 61 +++++++++++++++++++----------
>>  drivers/gpu/drm/drm_mipi_dbi.c      |  2 +-
>>  include/drm/drm_format_helper.h     |  4 +-
>>  3 files changed, 44 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
>> index 0897cb9aeaff..5c147c49668c 100644
>> --- a/drivers/gpu/drm/drm_format_helper.c
>> +++ b/drivers/gpu/drm/drm_format_helper.c
>> @@ -79,39 +79,60 @@ void drm_fb_memcpy_dstclip(void __iomem *dst, void *vaddr,
>>  EXPORT_SYMBOL(drm_fb_memcpy_dstclip);
>>  
>>  /**
>> - * drm_fb_swab16 - Swap bytes into clip buffer
>> - * @dst: RGB565 destination buffer
>> - * @vaddr: RGB565 source buffer
>> + * drm_fb_swab - Swap bytes into clip buffer
>> + * @dst: Destination buffer
>> + * @src: Source buffer
>>   * @fb: DRM framebuffer
>>   * @clip: Clip rectangle area to copy
>> + * @cached: Source buffer is mapped cached (eg. not write-combined)
>> + *
>> + * If @cached is false a temporary buffer is used to cache one pixel line at a
>> + * time to speed up slow uncached reads.
>> + *
>> + * This function does not apply clipping on dst, i.e. the destination
>> + * is a small buffer containing the clip rect only.
>>   */
>> -void drm_fb_swab16(u16 *dst, void *vaddr, struct drm_framebuffer *fb,
>> -		   struct drm_rect *clip)
>> +void drm_fb_swab(void *dst, void *src, struct drm_framebuffer *fb,
>> +		 struct drm_rect *clip, bool cached)
>>  {
>> -	size_t len = (clip->x2 - clip->x1) * sizeof(u16);
>> +	u8 cpp = fb->format->cpp[0];
> Use of format->cpp is deprecated, should be char_per_block according to
> the comment in drm_fourcc.h

I ducked this because if I had to do it properly I would have to look at
block width/height as well and yes ensure that num_planes is 1. That
would leave me with writing a helper function for something I don't
really understand :-)

static inline bool
drm_format_info_is_WHAT_TO_CALL_THIS(const struct drm_format_info *info)
{
	return info->num_planes == 1 &&
	       drm_format_info_block_width(info, 0) == 1 &&
	       drm_format_info_block_height(info, 0) == 1;
}

Or I could ofc just spell out the full assert inside this function:

	info->num_planes == 1 &&
	drm_format_info_block_width(info, 0) == 1 &&
	drm_format_info_block_height(info, 0) == 1 &&
	info->char_per_block[0] == 2 &&
	info->char_per_block[0] == 4

That way I don't have to know what I'm actually checking.
I'm using drm_fb_swab() for RGB formats, but it can be used for any
format that meets the above criteria.

And maybe I should check .hsub and .vsub as well, I don't know.

cpp was such a nice simple concept :-) So I'll keep it unless someone
knowledgeable shines some light on this.

> 
>> +	size_t len = drm_rect_width(clip) * cpp;
>> +	u16 *src16, *dst16 = dst;
>> +	u32 *src32, *dst32 = dst;
>>  	unsigned int x, y;
>> -	u16 *src, *buf;
>> +	void *buf = NULL;
>>  
>> -	/*
>> -	 * The cma memory is write-combined so reads are uncached.
>> -	 * Speed up by fetching one line at a time.
>> -	 */
>> -	buf = kmalloc(len, GFP_KERNEL);
>> -	if (!buf)
>> +	if (WARN_ON_ONCE(cpp == 1))
>>  		return;
> Or cpp != 2 && cpp != 4?

Indeed, I agree.

Noralf.

>>  
>> +	if (!cached)
>> +		buf = kmalloc(len, GFP_KERNEL);
>> +
>> +	src += clip_offset(clip, fb->pitches[0], cpp);
> Good that drm_rect_width() and clip_offset() are used,
> replacing open-coded variants.
> 
>> +
>>  	for (y = clip->y1; y < clip->y2; y++) {
>> -		src = vaddr + (y * fb->pitches[0]);
>> -		src += clip->x1;
>> -		memcpy(buf, src, len);
>> -		src = buf;
>> -		for (x = clip->x1; x < clip->x2; x++)
>> -			*dst++ = swab16(*src++);
>> +		if (buf) {
>> +			memcpy(buf, src, len);
>> +			src16 = buf;
>> +			src32 = buf;
>> +		} else {
>> +			src16 = src;
>> +			src32 = src;
>> +		}
>> +
>> +		for (x = clip->x1; x < clip->x2; x++) {
>> +			if (cpp == 4)
>> +				*dst32++ = swab32(*src32++);
>> +			else
>> +				*dst16++ = swab16(*src16++);
>> +		}
>> +
>> +		src += fb->pitches[0];
>>  	}
>>  
>>  	kfree(buf);
>>  }
>> -EXPORT_SYMBOL(drm_fb_swab16);
>> +EXPORT_SYMBOL(drm_fb_swab);
>>  
>>  static void drm_fb_xrgb8888_to_rgb565_line(u16 *dbuf, u32 *sbuf,
>>  					   unsigned int pixels,
>> diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
>> index 16bff1be4b8a..bfefbcb69287 100644
>> --- a/drivers/gpu/drm/drm_mipi_dbi.c
>> +++ b/drivers/gpu/drm/drm_mipi_dbi.c
>> @@ -217,7 +217,7 @@ int mipi_dbi_buf_copy(void *dst, struct drm_framebuffer *fb,
>>  	switch (fb->format->format) {
>>  	case DRM_FORMAT_RGB565:
>>  		if (swap)
>> -			drm_fb_swab16(dst, src, fb, clip);
>> +			drm_fb_swab(dst, src, fb, clip, !import_attach);
>>  		else
>>  			drm_fb_memcpy(dst, src, fb, clip);
>>  		break;
>> diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
>> index ac220aa1a245..5f9e37032468 100644
>> --- a/include/drm/drm_format_helper.h
>> +++ b/include/drm/drm_format_helper.h
>> @@ -14,8 +14,8 @@ void drm_fb_memcpy(void *dst, void *vaddr, struct drm_framebuffer *fb,
>>  void drm_fb_memcpy_dstclip(void __iomem *dst, void *vaddr,
>>  			   struct drm_framebuffer *fb,
>>  			   struct drm_rect *clip);
>> -void drm_fb_swab16(u16 *dst, void *vaddr, struct drm_framebuffer *fb,
>> -		   struct drm_rect *clip);
>> +void drm_fb_swab(void *dst, void *src, struct drm_framebuffer *fb,
>> +		 struct drm_rect *clip, bool cached);
>>  void drm_fb_xrgb8888_to_rgb565(void *dst, void *vaddr,
>>  			       struct drm_framebuffer *fb,
>>  			       struct drm_rect *clip, bool swab);
>> -- 
>> 2.23.0
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
