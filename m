Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 568472211CB
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jul 2020 18:01:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725992AbgGOP6u (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jul 2020 11:58:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725835AbgGOP6q (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jul 2020 11:58:46 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89A2CC061755
        for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2020 08:58:46 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id a23so677738pfk.13
        for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2020 08:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QkpoXygUV9GEl8wbmpwmboQ9ro21A37HIlO2HlpfSjM=;
        b=to9qifFSwC7S22ayBit3uDc/zI0FxBeB6QqLv8c6VcfPDsX+Scl77zmi6C3cLlmcao
         c8fznRe4LxveQ/hmiXfqd2HMjkJy0alG4FRxVA/qVSPhC4Z5ZObA4tyiB9gQybDDPSVM
         gGAzBpP/N7h4ZXt7V3Ze4CStqi7QQ8F3mvUZVPmL0rjUF6Y3f6JjNPnv6OBD031Wjdy9
         7+mGiyyHbMzixwnZrx7ybt5ozr3BHM6+yrA2ZkIcKrGdCUOaIuEqc3kYA+gR0+u4oDBV
         vnJ956L98uyb57EdMp+RluoTgg0eUfXIBqNLyP0REwRKf0YUfjEknajg42XEpnoWi0Xd
         KuoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=QkpoXygUV9GEl8wbmpwmboQ9ro21A37HIlO2HlpfSjM=;
        b=NmKSXWdMvpBTmSkXL5e8VCD1o3VI0zM6n0Hdu4+k669E+sB1TcmLHdSpjzIGPPWtn2
         jklccOY+RlmBpyaDmEifx8nAraD4Kf0ddsBgdWY7YEYFFTfEy37eQA06EpCaDsV4vIzj
         hJYgEw2duRkUZLoZA0vUekXm9jhU1kH38DLn9vu94+z+p8bUNy7ekXl4hoVq9+t5PqSb
         KQq+7dVyAepSS+slT1Wr6sHca1kz+F+f38z1yIU20QTX71EJiaHKTUIa/0lhMC6A3N9k
         EsnQo5XZyIzRUn3CcMmBpSIMfLXCu1EMF1x0oiCIXY0cWYLPfnm/0xIp+yT5mNqtlVs/
         rdKA==
X-Gm-Message-State: AOAM5333YWyo80Lf/j5ETZzq3caL1sEmXPSPj8Ur8gRyrYgKgbHCcEJK
        zEyfzlWDJ/HPGUavoa8s6jegihzn
X-Google-Smtp-Source: ABdhPJymOWthSQAFC1ee0O7nduhsnq/2RhHWG33MpGmFl7m7Zaq4oNJG+EnE3sd9/GL9qOABiPrWfg==
X-Received: by 2002:a65:428d:: with SMTP id j13mr319537pgp.211.1594828725914;
        Wed, 15 Jul 2020 08:58:45 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l126sm2655710pfd.202.2020.07.15.08.58.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2020 08:58:45 -0700 (PDT)
Subject: Re: [PATCH 4/6] usb: typec: tcpm: Refactor tcpm_handle_vdm_request
To:     Hans de Goede <hdegoede@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
References: <20200715132301.99816-1-hdegoede@redhat.com>
 <20200715132301.99816-5-hdegoede@redhat.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <68fd64dd-0543-7a94-225d-16d21a4de149@roeck-us.net>
Date:   Wed, 15 Jul 2020 08:58:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200715132301.99816-5-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 7/15/20 6:22 AM, Hans de Goede wrote:
> Refactor tcpm_handle_vdm_request and its tcpm_pd_svdm helper function so
> that reporting the results of the vdm to the altmode-driver is separated
> out into a clear separate step inside tcpm_handle_vdm_request, instead
> of being scattered over various places inside the tcpm_pd_svdm helper.
> 
> This is a preparation patch for fixing an AB BA lock inversion between the
> tcpm code and some altmode drivers.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/usb/typec/tcpm/tcpm.c | 80 +++++++++++++++++++++--------------
>  1 file changed, 49 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index bf5a0322dbfe..4745b4062000 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -159,6 +159,14 @@ enum pd_msg_request {
>  	PD_MSG_DATA_SOURCE_CAP,
>  };
>  
> +enum adev_actions {
> +	ADEV_NONE = 0,
> +	ADEV_NOTIFY_USB_AND_QUEUE_VDM,
> +	ADEV_QUEUE_VDM,
> +	ADEV_QUEUE_VDM_SEND_EXIT_MODE_ON_FAIL,
> +	ADEV_ATTENTION,
> +};
> +
>  /* Events from low level driver */
>  
>  #define TCPM_CC_EVENT		BIT(0)
> @@ -1079,9 +1087,8 @@ static void tcpm_register_partner_altmodes(struct tcpm_port *port)
>  #define supports_modal(port)	PD_IDH_MODAL_SUPP((port)->partner_ident.id_header)
>  
>  static int tcpm_pd_svdm(struct tcpm_port *port, const u32 *p, int cnt,
> -			u32 *response)
> +			u32 *response, enum adev_actions *adev_action)
>  {
> -	struct typec_altmode *adev;
>  	struct typec_altmode *pdev;
>  	struct pd_mode_data *modep;
>  	int rlen = 0;
> @@ -1097,9 +1104,6 @@ static int tcpm_pd_svdm(struct tcpm_port *port, const u32 *p, int cnt,
>  
>  	modep = &port->mode_data;
>  
> -	adev = typec_match_altmode(port->port_altmode, ALTMODE_DISCOVERY_MAX,
> -				   PD_VDO_VID(p[0]), PD_VDO_OPOS(p[0]));
> -
>  	pdev = typec_match_altmode(port->partner_altmode, ALTMODE_DISCOVERY_MAX,
>  				   PD_VDO_VID(p[0]), PD_VDO_OPOS(p[0]));
>  
> @@ -1125,8 +1129,7 @@ static int tcpm_pd_svdm(struct tcpm_port *port, const u32 *p, int cnt,
>  			break;
>  		case CMD_ATTENTION:
>  			/* Attention command does not have response */
> -			if (adev)
> -				typec_altmode_attention(adev, p[1]);
> +			*adev_action = ADEV_ATTENTION;
>  			return 0;
>  		default:
>  			break;
> @@ -1178,27 +1181,18 @@ static int tcpm_pd_svdm(struct tcpm_port *port, const u32 *p, int cnt,
>  			}
>  			break;
>  		case CMD_ENTER_MODE:
> -			if (adev && pdev) {
> +			if (pdev)
>  				typec_altmode_update_active(pdev, true);
>  

There is a slight semantic difference: typec_altmode_update_active() is now
called even if adev is NULL. Is this intentional ?

> -				if (typec_altmode_vdm(adev, p[0], &p[1], cnt)) {
> -					response[0] = VDO(adev->svid, 1,
> -							  CMD_EXIT_MODE);
> -					response[0] |= VDO_OPOS(adev->mode);
> -					return 1;
> -				}
> -			}
> +			*adev_action = ADEV_QUEUE_VDM_SEND_EXIT_MODE_ON_FAIL;
>  			return 0;
>  		case CMD_EXIT_MODE:
> -			if (adev && pdev) {
> +			if (pdev)
>  				typec_altmode_update_active(pdev, false);
>  
> -				/* Back to USB Operation */
> -				WARN_ON(typec_altmode_notify(adev,
> -							     TYPEC_STATE_USB,
> -							     NULL));
> -			}
> -			break;
> +			/* Back to USB Operation */
> +			*adev_action = ADEV_NOTIFY_USB_AND_QUEUE_VDM;
> +			return 0;
>  		default:
>  			break;
>  		}
> @@ -1207,11 +1201,8 @@ static int tcpm_pd_svdm(struct tcpm_port *port, const u32 *p, int cnt,
>  		switch (cmd) {
>  		case CMD_ENTER_MODE:
>  			/* Back to USB Operation */
> -			if (adev)
> -				WARN_ON(typec_altmode_notify(adev,
> -							     TYPEC_STATE_USB,
> -							     NULL));
> -			break;
> +			*adev_action = ADEV_NOTIFY_USB_AND_QUEUE_VDM;
> +			return 0;
>  		default:
>  			break;
>  		}
> @@ -1221,15 +1212,15 @@ static int tcpm_pd_svdm(struct tcpm_port *port, const u32 *p, int cnt,
>  	}
>  
>  	/* Informing the alternate mode drivers about everything */
> -	if (adev)
> -		typec_altmode_vdm(adev, p[0], &p[1], cnt);
> -
> +	*adev_action = ADEV_QUEUE_VDM;
>  	return rlen;
>  }
>  
>  static void tcpm_handle_vdm_request(struct tcpm_port *port,
>  				    const __le32 *payload, int cnt)
>  {
> +	enum adev_actions adev_action = ADEV_NONE;
> +	struct typec_altmode *adev;
>  	u32 p[PD_MAX_PAYLOAD];
>  	u32 response[8] = { };
>  	int i, rlen = 0;
> @@ -1237,6 +1228,9 @@ static void tcpm_handle_vdm_request(struct tcpm_port *port,
>  	for (i = 0; i < cnt; i++)
>  		p[i] = le32_to_cpu(payload[i]);
>  
> +	adev = typec_match_altmode(port->port_altmode, ALTMODE_DISCOVERY_MAX,
> +				   PD_VDO_VID(p[0]), PD_VDO_OPOS(p[0]));
> +
>  	if (port->vdm_state == VDM_STATE_BUSY) {
>  		/* If UFP responded busy retry after timeout */
>  		if (PD_VDO_CMDT(p[0]) == CMDT_RSP_BUSY) {
> @@ -1251,7 +1245,31 @@ static void tcpm_handle_vdm_request(struct tcpm_port *port,
>  	}
>  
>  	if (PD_VDO_SVDM(p[0]))
> -		rlen = tcpm_pd_svdm(port, p, cnt, response);
> +		rlen = tcpm_pd_svdm(port, p, cnt, response, &adev_action);
> +
> +	if (adev) {
> +		switch (adev_action) {
> +		case ADEV_NONE:
> +			break;
> +		case ADEV_NOTIFY_USB_AND_QUEUE_VDM:
> +			WARN_ON(typec_altmode_notify(adev, TYPEC_STATE_USB, NULL));
> +			typec_altmode_vdm(adev, p[0], &p[1], cnt);
> +			break;
> +		case ADEV_QUEUE_VDM:
> +			typec_altmode_vdm(adev, p[0], &p[1], cnt);
> +			break;
> +		case ADEV_QUEUE_VDM_SEND_EXIT_MODE_ON_FAIL:
> +			if (typec_altmode_vdm(adev, p[0], &p[1], cnt)) {
> +				response[0] = VDO(adev->svid, 1, CMD_EXIT_MODE);
> +				response[0] |= VDO_OPOS(adev->mode);
> +				rlen = 1;
> +			}
> +			break;
> +		case ADEV_ATTENTION:
> +			typec_altmode_attention(adev, p[1]);
> +			break;
> +		}
> +	}
>  
>  	if (rlen > 0)
>  		tcpm_queue_vdm_unlocked(port, response[0], &response[1], rlen - 1);
> 

