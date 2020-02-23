Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E02E169923
	for <lists+linux-usb@lfdr.de>; Sun, 23 Feb 2020 18:43:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726740AbgBWRn6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 23 Feb 2020 12:43:58 -0500
Received: from smtp.domeneshop.no ([194.63.252.55]:55881 "EHLO
        smtp.domeneshop.no" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726534AbgBWRn6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 23 Feb 2020 12:43:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
        ; s=ds201912; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Yvu2oKZOlC2jMRTg5bIqhX+gpozzd1r46c0VrXSAU0U=; b=aRhhK3XXrLYlMZ3oJ/XpG9I9Dy
        6eDrKihMBu2VjLCrhjmMUA+/cVr58ptpaam+Xk0s197pex9tbQzs4wP7eHaZzJBlo9dQUGcMqkJIl
        PS5Vud3A+VqIU3LYPNz+/Dymw2j9wKzDhnw0ARKGgZd2TWUeTtkpylJEiyUd6Ggg0HDUkd1apya9k
        qn4I3MWedtdvP/iwW1Idxtjaf5iOSzyjKFE8O+2erp+nABh2uwN3roNxLbfhiMfLABkhLvXIm6ae3
        s4cZY8qJkxEy7DZXUM8YZk1jdDyzgvP2gHzH/Nk/hwAdxDGjl+DdKoMIgJi0X6mR1PEoiSe2qXlwM
        Z8XdkcDA==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:50027 helo=[192.168.10.61])
        by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <noralf@tronnes.org>)
        id 1j5vIJ-0006bO-ID; Sun, 23 Feb 2020 18:43:55 +0100
Subject: Re: [RFC 8/9] drm/client: Add drm_client_init_from_id() and
 drm_client_modeset_set()
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     broonie@kernel.org, balbi@kernel.org, lee.jones@linaro.org,
        linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Greg KH <gregkh@linuxfoundation.org>
References: <20200216172117.49832-1-noralf@tronnes.org>
 <20200216172117.49832-9-noralf@tronnes.org>
 <20200217093836.GH2363188@phenom.ffwll.local>
From:   =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <393a8dcf-e01b-715c-551b-5108e42ebefc@tronnes.org>
Date:   Sun, 23 Feb 2020 18:43:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200217093836.GH2363188@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



Den 17.02.2020 10.38, skrev Daniel Vetter:
> On Sun, Feb 16, 2020 at 06:21:16PM +0100, Noralf Trønnes wrote:
>> drm_client_init_from_id() provides a way for clients to add a client based
>> on the minor. drm_client_modeset_set() provides a way to set the modeset
>> for clients that handles connectors and display mode on their own.
>>
>> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
>> ---
>>  drivers/gpu/drm/drm_client.c         | 37 ++++++++++++++++++++
>>  drivers/gpu/drm/drm_client_modeset.c | 52 ++++++++++++++++++++++++++++
>>  include/drm/drm_client.h             |  4 +++
>>  3 files changed, 93 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
>> index d9a2e3695525..dbd73fe8d987 100644
>> --- a/drivers/gpu/drm/drm_client.c
>> +++ b/drivers/gpu/drm/drm_client.c
>> @@ -112,6 +112,43 @@ int drm_client_init(struct drm_device *dev, struct drm_client_dev *client,
>>  }
>>  EXPORT_SYMBOL(drm_client_init);
>>  
>> +/**
>> + * drm_client_init_from_id - Initialise a DRM client
>> + * @minor_id: DRM minor id
>> + * @client: DRM client
>> + * @name: Client name
>> + * @funcs: DRM client functions (optional)
>> + *
>> + * This function looks up the drm_device using the minor id and initializes the client.
>> + * It also registeres the client to avoid a possible race with DRM device unregister.
> 
> I think another sentence here would be good, explaining that this is for
> drivers outside of drm to expose a specific drm driver in some fashion,
> and just outright mention your use-case as an example.
> 
> I'm also not sure whether lookup-by-minor is the greatest thing for
> kernel-internal lookups like this, maybe Greg has some idea?
> 

What alternatives do you see? Parent device name?

I did a scan to see what others are doing, and most have a consumer name
lookup on the struct device (Device Tree or lookup tables):

struct reset_control *__reset_control_get(struct device *dev, const char
*id,
					  int index, bool shared,
					  bool optional, bool acquired);

struct iio_channel *iio_channel_get(struct device *dev,
				    const char *consumer_channel);

struct regulator *__must_check regulator_get(struct device *dev,
					     const char *id);

struct pwm_device *pwm_get(struct device *dev, const char *con_id)

struct gpio_desc *__must_check gpiod_get(struct device *dev,
					 const char *con_id,
					 enum gpiod_flags flags);

SPI and I2C use the bus index as lookup:

extern struct i2c_adapter *i2c_get_adapter(int nr);

extern struct spi_controller *spi_busnum_to_master(u16 busnum);


Noralf.

>> + *
>> + * See drm_client_init() and drm_client_register().
>> + *
>> + * Returns:
>> + * Zero on success or negative error code on failure.
>> + */
>> +int drm_client_init_from_id(unsigned int minor_id, struct drm_client_dev *client,
>> +			    const char *name, const struct drm_client_funcs *funcs)
>> +{
>> +	struct drm_minor *minor;
>> +	int ret;
>> +
>> +	minor = drm_minor_acquire(minor_id);
>> +	if (IS_ERR(minor))
>> +		return PTR_ERR(minor);
>> +
>> +	mutex_lock(&minor->dev->clientlist_mutex);
>> +	ret = drm_client_init(minor->dev, client, name, funcs);
>> +	if (!ret)
>> +		list_add(&client->list, &minor->dev->clientlist);
>> +	mutex_unlock(&minor->dev->clientlist_mutex);
>> +
>> +	drm_minor_release(minor);
>> +
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL(drm_client_init_from_id);
>> +
>>  /**
>>   * drm_client_register - Register client
>>   * @client: DRM client
