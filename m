Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1F021C2A9C
	for <lists+linux-usb@lfdr.de>; Sun,  3 May 2020 09:48:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727799AbgECHsl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 3 May 2020 03:48:41 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:37536 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726884AbgECHsl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 3 May 2020 03:48:41 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id E6795804D8;
        Sun,  3 May 2020 09:48:38 +0200 (CEST)
Date:   Sun, 3 May 2020 09:48:37 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Cc:     dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 04/10] drm/client: Add drm_client_framebuffer_flush()
Message-ID: <20200503074837.GB11582@ravnborg.org>
References: <20200429124830.27475-1-noralf@tronnes.org>
 <20200429124830.27475-5-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200429124830.27475-5-noralf@tronnes.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=MOBOZvRl c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=8nJEP1OIZ-IA:10 a=SJz97ENfAAAA:8 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8
        a=KwKXY3Rj_ZBl5SXdunIA:9 a=wPNLvfGTeEIA:10 a=vFet0B0WnEQeilDPIY6i:22
        a=E9Po1WZjFZOl8hwRPBS3:22 a=Vxmtnl_E_bksehYqCbjh:22
        a=pHzHmUro8NiASowvMSCR:22 a=6VlIyEUom7LUIeUMNQJH:22
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Noralf.

On Wed, Apr 29, 2020 at 02:48:24PM +0200, Noralf Trønnes wrote:
> Some drivers need explicit flushing of buffer changes, add a function
> that does that.
I trust you on this.

> 
> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
Some bikeshedding below. Either way:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  drivers/gpu/drm/drm_client.c | 31 +++++++++++++++++++++++++++++++
>  include/drm/drm_client.h     |  1 +
>  2 files changed, 32 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
> index cb5ee9f1ffaa..8dbc2ecdcaea 100644
> --- a/drivers/gpu/drm/drm_client.c
> +++ b/drivers/gpu/drm/drm_client.c
> @@ -483,6 +483,37 @@ void drm_client_framebuffer_delete(struct drm_client_buffer *buffer)
>  }
>  EXPORT_SYMBOL(drm_client_framebuffer_delete);
>  
> +/**
> + * drm_client_framebuffer_flush - Manually flush client framebuffer
> + * @buffer: DRM client buffer (can be NULL)
> + * @rect: Damage rectangle (if NULL flushes all)
> + *
> + * This calls &drm_framebuffer_funcs->dirty (if present) to flush buffer changes
> + * for drivers that need it.
> + *
> + * Returns:
> + * Zero on success or negative error code on failure.
> + */

Alternative proposal - that I think is simpler.
But both variants works for me.
> +int drm_client_framebuffer_flush(struct drm_client_buffer *buffer, struct drm_rect *rect)
> +{
	struct drm_framebuffer_funcs *funcs;
	struct drm_clip_rect clip;
> +
> +	if (!buffer || !buffer->fb || !buffer->fb->funcs->dirty)
> +		return 0;
	funcs = buffer->fb->funcs;
> +
> +	if (rect) {
> +		clip.x1 = rect->x1;
> +		clip.y1 = rect->y1;
> +		clip.x2 = rect->x2;
> +		clip.y2 = rect->y2;
		return funcs->dirty(buffer->fb, buffer->client->file,
				    0, 0, &clip, 1);
> +	} else {
		return funcs->dirty(buffer->fb, buffer->client->file,
				    0, 0, NULL, 0);
	}

> +
> +	return buffer->fb->funcs->dirty(buffer->fb, buffer->client->file,
> +					0, 0, clip, clip ? 1 : 0);
> +}
> +EXPORT_SYMBOL(drm_client_framebuffer_flush);
> +
>  #ifdef CONFIG_DEBUG_FS
>  static int drm_client_debugfs_internal_clients(struct seq_file *m, void *data)
>  {
> diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
> index bbb5689fa9a8..6ef5364d6dfb 100644
> --- a/include/drm/drm_client.h
> +++ b/include/drm/drm_client.h
> @@ -156,6 +156,7 @@ struct drm_client_buffer {
>  struct drm_client_buffer *
>  drm_client_framebuffer_create(struct drm_client_dev *client, u32 width, u32 height, u32 format);
>  void drm_client_framebuffer_delete(struct drm_client_buffer *buffer);
> +int drm_client_framebuffer_flush(struct drm_client_buffer *buffer, struct drm_rect *rect);
>  void *drm_client_buffer_vmap(struct drm_client_buffer *buffer);
>  void drm_client_buffer_vunmap(struct drm_client_buffer *buffer);
>  
> -- 
> 2.23.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
