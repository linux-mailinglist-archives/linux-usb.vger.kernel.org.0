Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA2F51C2B0F
	for <lists+linux-usb@lfdr.de>; Sun,  3 May 2020 11:55:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728224AbgECJzA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 3 May 2020 05:55:00 -0400
Received: from smtp.domeneshop.no ([194.63.252.55]:39205 "EHLO
        smtp.domeneshop.no" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727971AbgECJzA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 3 May 2020 05:55:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
        ; s=ds201912; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=X21p+jrDOFBDYsPp52/LLvj2Q5MLglkIB748DUPTo+M=; b=BDCR6JKsZWj2U2CNJtoUdncGI7
        jpvT+k83/iwkiwV/TFVA2gIuAKGMrK01zC6unOiQOZ9ip+qlBk3xD0WbssdHtaNpjIau1C38sidqM
        I55pNa+yTDXqTbOjpIVUIILipSIcqvK8jB5eUTT0UnJS58MarDXndiCjACKBytrhRqX1chpXh5ixc
        moUPICcKqh1/u7cexG/3XYj+LNxcQdTcGXmLxpwQfc52v0V2G304XBuf+Pc5mDeLhkumZ4eW87vI4
        1RDwiurcp0kZ/5BxvTggqtwtyF474tgdcW5iuE+cafPGCol/y3KuyWQ3QSpGuqOhmxBlpFoChlNEZ
        RWcxS7Kg==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:54810 helo=[192.168.10.61])
        by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <noralf@tronnes.org>)
        id 1jVBKr-0005Um-DC; Sun, 03 May 2020 11:54:57 +0200
Subject: Re: [PATCH 04/10] drm/client: Add drm_client_framebuffer_flush()
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org
References: <20200429124830.27475-1-noralf@tronnes.org>
 <20200429124830.27475-5-noralf@tronnes.org>
 <20200503074837.GB11582@ravnborg.org>
From:   =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <17a3a14e-c4ea-6da6-db4e-675825ff0a11@tronnes.org>
Date:   Sun, 3 May 2020 11:54:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200503074837.GB11582@ravnborg.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



Den 03.05.2020 09.48, skrev Sam Ravnborg:
> Hi Noralf.
> 
> On Wed, Apr 29, 2020 at 02:48:24PM +0200, Noralf Trønnes wrote:
>> Some drivers need explicit flushing of buffer changes, add a function
>> that does that.
> I trust you on this.

All drivers in tiny/ and at least udl need to be told to flush changes.
For userspace this happens either by calling DRM_IOCTL_MODE_DIRTYFB or
doing a page/buffer flip DRM_IOCTL_MODE_PAGE_FLIP or do a
DRM_IOCTL_MODE_ATOMIC (can contain damage report using plane property
FB_DAMAGE_CLIPS). For drivers that use drm_gem_fb_create_with_dirty()
and the drm_damage_helper (all of them now I think) this will result in
an atomic commit. The driver can use drm_atomic_helper_damage_merged()
to get the combined damage rectangle.

Noralf.

> 
>>
>> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
> Some bikeshedding below. Either way:
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> 
>> ---
>>  drivers/gpu/drm/drm_client.c | 31 +++++++++++++++++++++++++++++++
>>  include/drm/drm_client.h     |  1 +
>>  2 files changed, 32 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
>> index cb5ee9f1ffaa..8dbc2ecdcaea 100644
>> --- a/drivers/gpu/drm/drm_client.c
>> +++ b/drivers/gpu/drm/drm_client.c
>> @@ -483,6 +483,37 @@ void drm_client_framebuffer_delete(struct drm_client_buffer *buffer)
>>  }
>>  EXPORT_SYMBOL(drm_client_framebuffer_delete);
>>  
>> +/**
>> + * drm_client_framebuffer_flush - Manually flush client framebuffer
>> + * @buffer: DRM client buffer (can be NULL)
>> + * @rect: Damage rectangle (if NULL flushes all)
>> + *
>> + * This calls &drm_framebuffer_funcs->dirty (if present) to flush buffer changes
>> + * for drivers that need it.
>> + *
>> + * Returns:
>> + * Zero on success or negative error code on failure.
>> + */
> 
> Alternative proposal - that I think is simpler.
> But both variants works for me.
>> +int drm_client_framebuffer_flush(struct drm_client_buffer *buffer, struct drm_rect *rect)
>> +{
> 	struct drm_framebuffer_funcs *funcs;
> 	struct drm_clip_rect clip;
>> +
>> +	if (!buffer || !buffer->fb || !buffer->fb->funcs->dirty)
>> +		return 0;
> 	funcs = buffer->fb->funcs;
>> +
>> +	if (rect) {
>> +		clip.x1 = rect->x1;
>> +		clip.y1 = rect->y1;
>> +		clip.x2 = rect->x2;
>> +		clip.y2 = rect->y2;
> 		return funcs->dirty(buffer->fb, buffer->client->file,
> 				    0, 0, &clip, 1);
>> +	} else {
> 		return funcs->dirty(buffer->fb, buffer->client->file,
> 				    0, 0, NULL, 0);
> 	}
> 
>> +
>> +	return buffer->fb->funcs->dirty(buffer->fb, buffer->client->file,
>> +					0, 0, clip, clip ? 1 : 0);
>> +}
>> +EXPORT_SYMBOL(drm_client_framebuffer_flush);
>> +
>>  #ifdef CONFIG_DEBUG_FS
>>  static int drm_client_debugfs_internal_clients(struct seq_file *m, void *data)
>>  {
>> diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
>> index bbb5689fa9a8..6ef5364d6dfb 100644
>> --- a/include/drm/drm_client.h
>> +++ b/include/drm/drm_client.h
>> @@ -156,6 +156,7 @@ struct drm_client_buffer {
>>  struct drm_client_buffer *
>>  drm_client_framebuffer_create(struct drm_client_dev *client, u32 width, u32 height, u32 format);
>>  void drm_client_framebuffer_delete(struct drm_client_buffer *buffer);
>> +int drm_client_framebuffer_flush(struct drm_client_buffer *buffer, struct drm_rect *rect);
>>  void *drm_client_buffer_vmap(struct drm_client_buffer *buffer);
>>  void drm_client_buffer_vunmap(struct drm_client_buffer *buffer);
>>  
>> -- 
>> 2.23.0
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
