Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38D291C2B70
	for <lists+linux-usb@lfdr.de>; Sun,  3 May 2020 12:50:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728139AbgECKu5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 3 May 2020 06:50:57 -0400
Received: from smtp.domeneshop.no ([194.63.252.55]:37221 "EHLO
        smtp.domeneshop.no" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727125AbgECKu4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 3 May 2020 06:50:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
        ; s=ds201912; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=GhD6aPq+FbY5bmX3cJih7DM13acMSBI2U8cVMBW3BaQ=; b=nKMlYkQym2UR77ihZ5NODQGTWk
        2QeooAFftEKQYgzVlZAqZ2sKrOKKoYcxS8r1odnLEjktXdydRRImlML7zNeix++/o1qT6SeEWdCAG
        kA7K+XSGk9E49SLvYlp5ZpDMxZMPSBMlW3XSmePbXtRASRpxYDa7sGScjs1sEsQDAYGkCHivjB0Ce
        Fu0UYSBT7NgN58jh7bGS6zUbJbtKehACyQd24bYW1DGVRZ6n1UfXoQXuXBWKukHMLcwSSdnE4oHfQ
        1xE9TdYfNANtZz1CedhbUAqfIlO31PLwtjfa9dakPJz40+FryJkGAkXQsuiT5hMigG4noZQwBQD5R
        08zXJkKw==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:55035 helo=[192.168.10.61])
        by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <noralf@tronnes.org>)
        id 1jVCCz-0008Ft-9U; Sun, 03 May 2020 12:50:53 +0200
Subject: Re: [PATCH 06/10] drm/client: Add a way to set modeset, properties
 and rotation
To:     Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org
References: <20200429124830.27475-1-noralf@tronnes.org>
 <20200429124830.27475-7-noralf@tronnes.org>
 <20200503084718.GD11582@ravnborg.org>
From:   =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <84c54b76-a16a-f97a-592b-53301178c394@tronnes.org>
Date:   Sun, 3 May 2020 12:50:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200503084718.GD11582@ravnborg.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



Den 03.05.2020 10.47, skrev Sam Ravnborg:
> Hi Noralf.
> 
> Some comments in the following - partly because I still do not fully
> grasp modeset etc.

I still don't fully understand it either. I have wandered inside the
atomic machinery countless times to track what happens to this or that
state/property and 2 weeks later the insight is gone. It just doesn't
stick. What makes it difficult for me I believe is that I have never
looked much at the userspace side, how this is all used.

> 
> 	Sam
> 
> On Wed, Apr 29, 2020 at 02:48:26PM +0200, Noralf Trønnes wrote:
>> This adds functions for clients that need more control over the
>> configuration than what's setup by drm_client_modeset_probe().
>> Connector, fb and display mode can be set using drm_client_modeset_set().
>> Plane rotation can be set using drm_client_modeset_set_rotation() and
>> other properties using drm_client_modeset_set_property(). Property
>> setting is only implemented for atomic drivers.
>>
>> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
>> ---
>>  drivers/gpu/drm/drm_client_modeset.c | 139 +++++++++++++++++++++++++++
>>  include/drm/drm_client.h             |  38 +++++++-
>>  2 files changed, 176 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
>> index 177158ff2a40..1eef6869cae1 100644
>> --- a/drivers/gpu/drm/drm_client_modeset.c
>> +++ b/drivers/gpu/drm/drm_client_modeset.c
>> @@ -83,6 +83,10 @@ static void drm_client_modeset_release(struct drm_client_dev *client)
>>  		}
>>  		modeset->num_connectors = 0;
>>  	}
>> +
>> +	kfree(client->properties);
>> +	client->properties = NULL;
>> +	client->num_properties = 0;
> 
> I failed to see why this code is in drm_client_modeset_release()
> and not in drm_client_modeset_free().
> In other words - why do we need to free properties in drm_client_modeset_probe()
> which is the only other user of drm_client_modeset_release().

This is legacy behaviour that was moved over from drm_fb_helper. It
cleared the modeset before probing for a new useable modeset. So the
same applies when the client sets the modeset itself, we need to clear
out the previous modeset.

If drm_client was written from scratch, the state/modeset would not be
stored in drm_client_dev, but stored by the client.

With the current situation a client can't check a configuration while
retaining a working config/state. It looses the working state setting up
one for testing.

This is not a problem for my usecase, but it can be for a future
usecase. Since it works for me I decided to keep it as-is instead of
trying to fix this without knowing what the future usecase might be.

> 
>>  }
>>  
>>  void drm_client_modeset_free(struct drm_client_dev *client)
>> @@ -879,6 +883,132 @@ int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width,
>>  }
>>  EXPORT_SYMBOL(drm_client_modeset_probe);
>>  
>> +/**
>> + * drm_client_modeset_set() - Set modeset configuration
>> + * @client: DRM client
>> + * @connector: Connector
>> + * @mode: Display mode
>> + * @fb: Framebuffer
>> + *
>> + * This function releases any current modeset info, including properties, and
>> + * sets the new modeset in the client's modeset array.
>> + *
>> + * Returns:
>> + * Zero on success or negative error code on failure.
>> + */
>> +int drm_client_modeset_set(struct drm_client_dev *client, struct drm_connector *connector,
>> +			   struct drm_display_mode *mode, struct drm_framebuffer *fb)
>> +{
>> +	struct drm_mode_set *modeset;
>> +	int ret = -ENOENT;
>> +
> Need to check if atomic is supported?

Not needed here because drm_client_modeset_commit() supports
legacy/non-atomic.

> Or maybe I just do not get all this atomic stuff yet..
> 
>> +	mutex_lock(&client->modeset_mutex);
>> +
>> +	drm_client_modeset_release(client);
> If the check below fails - is it then correct to release modeset?
>> +
>> +	if (!connector || !mode || !fb) {
>> +		ret = 0;
> Error out, it is not a success if we cannot do anything?

Ah, I haven't documented this. This actually clears the modesets. If
this is commited, it results in all outputs being turned off.
Maybe I should do a drm_client_modeset_clear() instead.

> 
>> +		goto unlock;
>> +	}
>> +
>> +	drm_client_for_each_modeset(modeset, client) {
>> +		if (!connector_has_possible_crtc(connector, modeset->crtc))
>> +			continue;
>> +
>> +		modeset->mode = drm_mode_duplicate(client->dev, mode);
>> +		if (!modeset->mode) {
>> +			ret = -ENOMEM;
>> +			break;
>> +		}
>> +
>> +		drm_mode_set_crtcinfo(modeset->mode, CRTC_INTERLACE_HALVE_V);
>> +
>> +		drm_connector_get(connector);
>> +		modeset->connectors[modeset->num_connectors++] = connector;
>> +
>> +		modeset->fb = fb;
>> +		ret = 0;
>> +		break;
>> +	}
>> +unlock:
>> +	mutex_unlock(&client->modeset_mutex);
>> +
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL(drm_client_modeset_set);
>> +
>> +/**
>> + * drm_client_modeset_set_property() - Set a property on the current configuration
>> + * @client: DRM client
>> + * @obj: DRM Mode Object
>> + * @prop: DRM Property
>> + * @value: Property value
>> + *
>> + * Note: Currently only implemented for atomic drivers.
> Are there any reason to in the future support legacy (non-atomic)
> drivers.
> If not then reword - as the above reads like it is on a TODO list to
> support legacy drivers.

It is possible to implement for legacy drivers in
drm_client_modeset_commit_legacy() like the plane property is done, but
I'm not going to do it. So it's not a TODO, but should imply a possibility.

If you a have a better way to express that I'm all ears.

> 
>> + *
>> + * Returns:
>> + * Zero on success or negative error code on failure.
>> + */
>> +int drm_client_modeset_set_property(struct drm_client_dev *client, struct drm_mode_object *obj,
>> +				    struct drm_property *prop, u64 value)
>> +{
>> +	struct drm_client_property *properties;
>> +	int ret = 0;
>> +
>> +	if (!prop)
>> +		return -EINVAL;
>> +
> Need to check if atomic is supported?
> Or maybe I just do not get all this atomic stuff yet..

Indeed, I should follow up on the docs and return -EOPNOTSUPP.

> 
>> +	mutex_lock(&client->modeset_mutex);
>> +
>> +	properties = krealloc(client->properties,
>> +			      (client->num_properties + 1) * sizeof(*properties), GFP_KERNEL);
>> +	if (!properties) {
>> +		ret = -ENOMEM;
>> +		goto unlock;
>> +	}
>> +
>> +	properties[client->num_properties].obj = obj;
>> +	properties[client->num_properties].prop = prop;
> The drm_client_modeset_set_property() take over ownership of prop.
> This looks wrong - should this be a copy of prop?
> properties[].prop should not be a pointer but a full drm_property
> struct?

prop is stored in the drm_mode_config object and is immutable so we
don't take ownership, but merely get a ref to it. For atomic the
property value is stored in the state. See
drm_atomic_connector_set_property() as an example.

Example use:

drm_client_modeset_set_property(client, &connector->base,
config->tv_hue_property, val);


> 
>> +	properties[client->num_properties].value = value;
>> +	client->properties = properties;
>> +	client->num_properties++;
>> +unlock:
>> +	mutex_unlock(&client->modeset_mutex);
>> +
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL(drm_client_modeset_set_property);
>> +
>> +/**
>> + * drm_client_modeset_set_rotation() - Set rotation on the current configuration
>> + * @client: DRM client
>> + * @value: Rotation value
>> + *
>> + * Returns:
>> + * Zero on success or negative error code on failure.
>> + */
>> +int drm_client_modeset_set_rotation(struct drm_client_dev *client, u64 value)
>> +{
>> +	struct drm_plane *plane = NULL;
>> +	struct drm_mode_set *modeset;
>> +
>> +	mutex_lock(&client->modeset_mutex);
>> +	drm_client_for_each_modeset(modeset, client) {
>> +		if (modeset->mode) {
>> +			plane = modeset->crtc->primary;
>> +			break;
>> +		}
>> +	}
>> +	mutex_unlock(&client->modeset_mutex);
>> +
>> +	if (!plane)
>> +		return -ENOENT;
>> +
>> +	return drm_client_modeset_set_property(client, &plane->base,
>> +					       plane->rotation_property, value);
>> +}
>> +EXPORT_SYMBOL(drm_client_modeset_set_rotation);
>> +
>>  /**
>>   * drm_client_rotation() - Check the initial rotation value
>>   * @modeset: DRM modeset
>> @@ -973,6 +1103,7 @@ static int drm_client_modeset_commit_atomic(struct drm_client_dev *client, bool
>>  	struct drm_atomic_state *state;
>>  	struct drm_modeset_acquire_ctx ctx;
>>  	struct drm_mode_set *mode_set;
>> +	unsigned int i;
>>  	int ret;
>>  
>>  	drm_modeset_acquire_init(&ctx, 0);
>> @@ -1033,6 +1164,14 @@ static int drm_client_modeset_commit_atomic(struct drm_client_dev *client, bool
>>  		}
>>  	}
>>  
>> +	for (i = 0; i < client->num_properties; i++) {
>> +		struct drm_client_property *prop = &client->properties[i];
>> +
>> +		ret = drm_atomic_set_property(state, NULL, prop->obj, prop->prop, prop->value);
>> +		if (ret)
>> +			goto out_state;
>> +	}
>> +
> With the code above drm_atomic_set_property() is called also when check
> is true. I had expected that check would not change anything.

If you look at this function in full, you see that we allocate a state
and set properties on that state. So we only change this local state. We
need to set the properties when checking so see if the driver accepts them.

If all drivers where atomic, we could let the client have access to
drm_atomic_state instead of storing modesets and properties in
drm_client_dev. Maybe we could have a drm_client_state structure to hold
modesets and properties, I don't know. Maybe Daniel can chime in here,
if we want to fix this now or leave it to a future user that needs to
check one config while having a working config.

Noralf.

> 
>>  	if (check)
>>  		ret = drm_atomic_check_only(state);
>>  	else
>> diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
>> index b6ffa4863e45..4b266741ec0e 100644
>> --- a/include/drm/drm_client.h
>> +++ b/include/drm/drm_client.h
>> @@ -16,6 +16,7 @@ struct drm_file;
>>  struct drm_framebuffer;
>>  struct drm_gem_object;
>>  struct drm_minor;
>> +struct drm_property;
>>  struct module;
>>  
>>  /**
>> @@ -64,6 +65,26 @@ struct drm_client_funcs {
>>  	int (*hotplug)(struct drm_client_dev *client);
>>  };
>>  
>> +/**
>> + * struct drm_client_property - DRM client property
>> + */
>> +struct drm_client_property {
>> +	/**
>> +	 * @obj: DRM Mode Object to which the property belongs.
>> +	 */
>> +	struct drm_mode_object *obj;
>> +
>> +	/**
>> +	 * @prop: DRM Property.
>> +	 */
>> +	struct drm_property *prop;
>> +
>> +	/**
>> +	 * @value: Property value.
>> +	 */
>> +	u64 value;
>> +};
>> +
>>  /**
>>   * struct drm_client_dev - DRM client instance
>>   */
>> @@ -97,7 +118,7 @@ struct drm_client_dev {
>>  	struct drm_file *file;
>>  
>>  	/**
>> -	 * @modeset_mutex: Protects @modesets.
>> +	 * @modeset_mutex: Protects @modesets and @properties.
>>  	 */
>>  	struct mutex modeset_mutex;
>>  
>> @@ -105,6 +126,16 @@ struct drm_client_dev {
>>  	 * @modesets: CRTC configurations
>>  	 */
>>  	struct drm_mode_set *modesets;
>> +
>> +	/**
>> +	 * @properties: DRM properties attached to the configuration.
>> +	 */
>> +	struct drm_client_property *properties;
>> +
>> +	/**
>> +	 * @num_properties: Number of attached properties.
>> +	 */
>> +	unsigned int num_properties;
>>  };
>>  
>>  int drm_client_init(struct drm_device *dev, struct drm_client_dev *client,
>> @@ -163,6 +194,11 @@ void drm_client_buffer_vunmap(struct drm_client_buffer *buffer);
>>  int drm_client_modeset_create(struct drm_client_dev *client);
>>  void drm_client_modeset_free(struct drm_client_dev *client);
>>  int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width, unsigned int height);
>> +int drm_client_modeset_set(struct drm_client_dev *client, struct drm_connector *connector,
>> +			   struct drm_display_mode *mode, struct drm_framebuffer *fb);
>> +int drm_client_modeset_set_property(struct drm_client_dev *client, struct drm_mode_object *obj,
>> +				    struct drm_property *prop, u64 value);
>> +int drm_client_modeset_set_rotation(struct drm_client_dev *client, u64 value);
>>  bool drm_client_rotation(struct drm_mode_set *modeset, unsigned int *rotation);
>>  int drm_client_modeset_check(struct drm_client_dev *client);
>>  int drm_client_modeset_commit_locked(struct drm_client_dev *client);
>> -- 
>> 2.23.0
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
