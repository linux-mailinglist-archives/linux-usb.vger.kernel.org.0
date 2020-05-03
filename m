Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B91711C2B13
	for <lists+linux-usb@lfdr.de>; Sun,  3 May 2020 12:03:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727916AbgECKDA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 3 May 2020 06:03:00 -0400
Received: from smtp.domeneshop.no ([194.63.252.55]:35009 "EHLO
        smtp.domeneshop.no" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727846AbgECKDA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 3 May 2020 06:03:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
        ; s=ds201912; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=NS2CoJYzw0IxS1YT0lJIqQoh5wQ4JpU1SpV5xxu+elo=; b=FAYc8J7Ay3MDGNz/e+OgM/ytUV
        Twfj4DZGOz+dfMlvCwM0q/1KAa+3y7j7d00JM00B4i1wAgjNbdBE9cbtkyV6yu8ntE7PUlhzCL5K8
        coksxwq9Yur6d+igWXRrCyyTfGZCDJSuZsjLZC3AiJHKhzlr9EydjzuLUHnYOj6C+pGWuBpfx/CKZ
        og/bjLmoC+pNANQ7sMI+qEg1uN65zvQHaCW9WvZ0a9+diVojzFwV2vcDArcYbt0PqyDHW/zNv2Uez
        WtHKjXbu+IZT/QRlc0lx4iXriUS8kxPrvpz0Rw5XLhDA3xt5apuYAts04sWrTLbuEr6UAJKeqraei
        Oi4Nx3Bw==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:54850 helo=[192.168.10.61])
        by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <noralf@tronnes.org>)
        id 1jVBSb-0006vM-73; Sun, 03 May 2020 12:02:57 +0200
Subject: Re: [PATCH 05/10] drm/client: Add drm_client_modeset_check()
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org
References: <20200429124830.27475-1-noralf@tronnes.org>
 <20200429124830.27475-6-noralf@tronnes.org>
 <20200503080330.GC11582@ravnborg.org>
From:   =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <5e4598a4-37fe-5a2d-cf71-76c43cbb8b08@tronnes.org>
Date:   Sun, 3 May 2020 12:02:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200503080330.GC11582@ravnborg.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



Den 03.05.2020 10.03, skrev Sam Ravnborg:
> Hi Noralf.
> 
> On Wed, Apr 29, 2020 at 02:48:25PM +0200, Noralf Trønnes wrote:
>> Add a way for client to check the configuration before comitting.
>>
>> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
> Two small ntis. With these addressed:
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
>> ---
>>  drivers/gpu/drm/drm_client_modeset.c | 35 ++++++++++++++++++++++++----
>>  include/drm/drm_client.h             |  1 +
>>  2 files changed, 32 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
>> index 7443114bd713..177158ff2a40 100644
>> --- a/drivers/gpu/drm/drm_client_modeset.c
>> +++ b/drivers/gpu/drm/drm_client_modeset.c
>> @@ -966,7 +966,7 @@ bool drm_client_rotation(struct drm_mode_set *modeset, unsigned int *rotation)
>>  }
>>  EXPORT_SYMBOL(drm_client_rotation);
>>  
>> -static int drm_client_modeset_commit_atomic(struct drm_client_dev *client, bool active)
>> +static int drm_client_modeset_commit_atomic(struct drm_client_dev *client, bool active, bool check)
>>  {
>>  	struct drm_device *dev = client->dev;
>>  	struct drm_plane *plane;
>> @@ -1033,7 +1033,10 @@ static int drm_client_modeset_commit_atomic(struct drm_client_dev *client, bool
>>  		}
>>  	}
>>  
>> -	ret = drm_atomic_commit(state);
>> +	if (check)
>> +		ret = drm_atomic_check_only(state);
>> +	else
>> +		ret = drm_atomic_commit(state);
>>  
>>  out_state:
>>  	if (ret == -EDEADLK)
>> @@ -1094,6 +1097,30 @@ static int drm_client_modeset_commit_legacy(struct drm_client_dev *client)
>>  	return ret;
>>  }
>>  
>> +/**
>> + * drm_client_modeset_check() - Check CRTC configuration
> This part of the comment does not match the description below.
> 
> 
>> + * @client: DRM client
>> + *
>> + * Check modeset configuration.
>> + *
>> + * Returns:
>> + * Zero on success or negative error code on failure.
>> + */
>> +int drm_client_modeset_check(struct drm_client_dev *client)
>> +{
>> +	int ret;
>> +
>> +	if (!drm_drv_uses_atomic_modeset(client->dev))
>> +		return 0;
> If client does not use atomic the check should fail - no?

Returning an error here would result in the client not working with
non-atomic drivers which AFAIK doesn't have a way to check the state
before hand. The client have to commit the state/configuration to find
out if it is good.

Noralf.

> 
>> +
>> +	mutex_lock(&client->modeset_mutex);
>> +	ret = drm_client_modeset_commit_atomic(client, true, true);
>> +	mutex_unlock(&client->modeset_mutex);
>> +
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL(drm_client_modeset_check);
>> +
>>  /**
>>   * drm_client_modeset_commit_locked() - Force commit CRTC configuration
>>   * @client: DRM client
>> @@ -1112,7 +1139,7 @@ int drm_client_modeset_commit_locked(struct drm_client_dev *client)
>>  
>>  	mutex_lock(&client->modeset_mutex);
>>  	if (drm_drv_uses_atomic_modeset(dev))
>> -		ret = drm_client_modeset_commit_atomic(client, true);
>> +		ret = drm_client_modeset_commit_atomic(client, true, false);
>>  	else
>>  		ret = drm_client_modeset_commit_legacy(client);
>>  	mutex_unlock(&client->modeset_mutex);
>> @@ -1188,7 +1215,7 @@ int drm_client_modeset_dpms(struct drm_client_dev *client, int mode)
>>  
>>  	mutex_lock(&client->modeset_mutex);
>>  	if (drm_drv_uses_atomic_modeset(dev))
>> -		ret = drm_client_modeset_commit_atomic(client, mode == DRM_MODE_DPMS_ON);
>> +		ret = drm_client_modeset_commit_atomic(client, mode == DRM_MODE_DPMS_ON, false);
>>  	else
>>  		drm_client_modeset_dpms_legacy(client, mode);
>>  	mutex_unlock(&client->modeset_mutex);
>> diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
>> index 6ef5364d6dfb..b6ffa4863e45 100644
>> --- a/include/drm/drm_client.h
>> +++ b/include/drm/drm_client.h
>> @@ -164,6 +164,7 @@ int drm_client_modeset_create(struct drm_client_dev *client);
>>  void drm_client_modeset_free(struct drm_client_dev *client);
>>  int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width, unsigned int height);
>>  bool drm_client_rotation(struct drm_mode_set *modeset, unsigned int *rotation);
>> +int drm_client_modeset_check(struct drm_client_dev *client);
>>  int drm_client_modeset_commit_locked(struct drm_client_dev *client);
>>  int drm_client_modeset_commit(struct drm_client_dev *client);
>>  int drm_client_modeset_dpms(struct drm_client_dev *client, int mode);
>> -- 
>> 2.23.0
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
