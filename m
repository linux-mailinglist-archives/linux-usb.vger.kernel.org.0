Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 056C72211B5
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jul 2020 17:52:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725932AbgGOPwV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jul 2020 11:52:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725834AbgGOPwU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jul 2020 11:52:20 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4813CC061755
        for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2020 08:52:20 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id g67so3270142pgc.8
        for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2020 08:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aGqR3XESbbGslJzY68oBmZAVylysXkqWvIe0qItJ+Bs=;
        b=eL7Hb1B83VwGOu1jCvMAp8ASYoFN112mW14OxqSpZHrMNDPlDjIqcvGDoqaPVKcHBO
         MLEW8rZSYHQmHRsSE39FqVETywggx/WQynMKwi6x7pMv37ggrSlcsi5xfnHz+OzQi6Re
         /2DJILixrt7rGRQ4gTztfPVqp326GmUm7Pa1WPC2r9U2wFS1mc8PeyvyrtZFNAOuiXAM
         wmUNU3zYIajQrzd67fD/f0Qom5o0+rRWk5YR4kySo29i6+V7EuRzah6EGmyohcsuaNRa
         h2BJr/MPugQdElsnByey22cil4JVFq2itegZ34uRs40l15eTUhNarizFb2OhvSytUA+E
         bO+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=aGqR3XESbbGslJzY68oBmZAVylysXkqWvIe0qItJ+Bs=;
        b=ODlEblF1Smz3X+x1cKKzKIiGlxepmKmeLo2jH1M49GM8EBufSgaPhvKhAb22DY5Kqb
         +BuB/9dLoWkIN4sSDwoIMo0YdLyvDNbQLgsXzSt/NLZmYbazCd0sy21V1wsP3ZwTk3YL
         kD8pb056sgz9vZj8mwXaZ+U+bZyGXq6jfFqPiRPZSEJBCOLiV4RHKpPd2IvkE4vOilz7
         WWavHGt5V1UqR83Co2mFQj4E8RoxYI5i5Lf6swxRKSauWU1/1Gao3MC4hR6Z+ZPOjk2U
         iHbmzwPYBIBmNrgyOgLQAJxGfRZI0VCQtcl9ixfPdnn9941KQEbZ6NovHiMNpHgpA2Jf
         yPwA==
X-Gm-Message-State: AOAM530ma4iQYi4zRkoZUsybY3v6r+QScABFwMjMjM6+UOrwmL1xp8mL
        r3cvlI8P7MsEzAj/Jwh8EcZ72lvN
X-Google-Smtp-Source: ABdhPJxQA23FlqQqvwNWiR+mHo7k2dAGJckvBdoDdcBMW4LdhR6mLVhCGBXbnwZmtlYZIT9Ypqugkg==
X-Received: by 2002:a63:3e09:: with SMTP id l9mr296535pga.235.1594828339386;
        Wed, 15 Jul 2020 08:52:19 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z10sm2556937pfr.90.2020.07.15.08.52.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2020 08:52:18 -0700 (PDT)
Subject: Re: [PATCH 3/6] usb: typec: tcpm: Refactor tcpm_handle_vdm_request
 payload handling
To:     Hans de Goede <hdegoede@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
References: <20200715132301.99816-1-hdegoede@redhat.com>
 <20200715132301.99816-4-hdegoede@redhat.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <6f9d0aa4-2fd7-b98c-969c-394320fcf07a@roeck-us.net>
Date:   Wed, 15 Jul 2020 08:52:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200715132301.99816-4-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 7/15/20 6:22 AM, Hans de Goede wrote:
> Refactor the tcpm_handle_vdm_request payload handling by doing the
> endianness conversion only once directly inside tcpm_handle_vdm_request
> itself instead of doing it multiple times inside various helper functions
> called by tcpm_handle_vdm_request.
> 
> This is a preparation patch for some further refactoring to fix an AB BA
> lock inversion between the tcpm code and some altmode drivers.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/usb/typec/tcpm/tcpm.c | 49 ++++++++++++++++-------------------
>  1 file changed, 22 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 30e997d6ea1e..bf5a0322dbfe 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -981,16 +981,15 @@ static void tcpm_queue_vdm(struct tcpm_port *port, const u32 header,
>  	mutex_unlock(&port->lock);
>  }
>  
> -static void svdm_consume_identity(struct tcpm_port *port, const __le32 *payload,
> -				  int cnt)
> +static void svdm_consume_identity(struct tcpm_port *port, const u32 *p, int cnt)
>  {
> -	u32 vdo = le32_to_cpu(payload[VDO_INDEX_IDH]);
> -	u32 product = le32_to_cpu(payload[VDO_INDEX_PRODUCT]);
> +	u32 vdo = p[VDO_INDEX_IDH];
> +	u32 product = p[VDO_INDEX_PRODUCT];
>  
>  	memset(&port->mode_data, 0, sizeof(port->mode_data));
>  
>  	port->partner_ident.id_header = vdo;
> -	port->partner_ident.cert_stat = le32_to_cpu(payload[VDO_INDEX_CSTAT]);
> +	port->partner_ident.cert_stat = p[VDO_INDEX_CSTAT];
>  	port->partner_ident.product = product;
>  
>  	typec_partner_set_identity(port->partner);
> @@ -1000,17 +999,15 @@ static void svdm_consume_identity(struct tcpm_port *port, const __le32 *payload,
>  		 PD_PRODUCT_PID(product), product & 0xffff);
>  }
>  
> -static bool svdm_consume_svids(struct tcpm_port *port, const __le32 *payload,
> -			       int cnt)
> +static bool svdm_consume_svids(struct tcpm_port *port, const u32 *p, int cnt)
>  {
>  	struct pd_mode_data *pmdata = &port->mode_data;
>  	int i;
>  
>  	for (i = 1; i < cnt; i++) {
> -		u32 p = le32_to_cpu(payload[i]);
>  		u16 svid;
>  
> -		svid = (p >> 16) & 0xffff;
> +		svid = (p[i] >> 16) & 0xffff;
>  		if (!svid)
>  			return false;
>  
> @@ -1020,7 +1017,7 @@ static bool svdm_consume_svids(struct tcpm_port *port, const __le32 *payload,
>  		pmdata->svids[pmdata->nsvids++] = svid;
>  		tcpm_log(port, "SVID %d: 0x%x", pmdata->nsvids, svid);
>  
> -		svid = p & 0xffff;
> +		svid = p[i] & 0xffff;
>  		if (!svid)
>  			return false;
>  
> @@ -1036,8 +1033,7 @@ static bool svdm_consume_svids(struct tcpm_port *port, const __le32 *payload,
>  	return false;
>  }
>  
> -static void svdm_consume_modes(struct tcpm_port *port, const __le32 *payload,
> -			       int cnt)
> +static void svdm_consume_modes(struct tcpm_port *port, const u32 *p, int cnt)
>  {
>  	struct pd_mode_data *pmdata = &port->mode_data;
>  	struct typec_altmode_desc *paltmode;
> @@ -1054,7 +1050,7 @@ static void svdm_consume_modes(struct tcpm_port *port, const __le32 *payload,
>  
>  		paltmode->svid = pmdata->svids[pmdata->svid_index];
>  		paltmode->mode = i;
> -		paltmode->vdo = le32_to_cpu(payload[i]);
> +		paltmode->vdo = p[i];
>  
>  		tcpm_log(port, " Alternate mode %d: SVID 0x%04x, VDO %d: 0x%08x",
>  			 pmdata->altmodes, paltmode->svid,
> @@ -1082,21 +1078,17 @@ static void tcpm_register_partner_altmodes(struct tcpm_port *port)
>  
>  #define supports_modal(port)	PD_IDH_MODAL_SUPP((port)->partner_ident.id_header)
>  
> -static int tcpm_pd_svdm(struct tcpm_port *port, const __le32 *payload, int cnt,
> +static int tcpm_pd_svdm(struct tcpm_port *port, const u32 *p, int cnt,
>  			u32 *response)
>  {
>  	struct typec_altmode *adev;
>  	struct typec_altmode *pdev;
>  	struct pd_mode_data *modep;
> -	u32 p[PD_MAX_PAYLOAD];
>  	int rlen = 0;
>  	int cmd_type;
>  	int cmd;
>  	int i;
>  
> -	for (i = 0; i < cnt; i++)
> -		p[i] = le32_to_cpu(payload[i]);
> -
>  	cmd_type = PD_VDO_CMDT(p[0]);
>  	cmd = PD_VDO_CMD(p[0]);
>  
> @@ -1157,13 +1149,13 @@ static int tcpm_pd_svdm(struct tcpm_port *port, const __le32 *payload, int cnt,
>  		switch (cmd) {
>  		case CMD_DISCOVER_IDENT:
>  			/* 6.4.4.3.1 */
> -			svdm_consume_identity(port, payload, cnt);
> +			svdm_consume_identity(port, p, cnt);
>  			response[0] = VDO(USB_SID_PD, 1, CMD_DISCOVER_SVID);
>  			rlen = 1;
>  			break;
>  		case CMD_DISCOVER_SVID:
>  			/* 6.4.4.3.2 */
> -			if (svdm_consume_svids(port, payload, cnt)) {
> +			if (svdm_consume_svids(port, p, cnt)) {
>  				response[0] = VDO(USB_SID_PD, 1,
>  						  CMD_DISCOVER_SVID);
>  				rlen = 1;
> @@ -1175,7 +1167,7 @@ static int tcpm_pd_svdm(struct tcpm_port *port, const __le32 *payload, int cnt,
>  			break;
>  		case CMD_DISCOVER_MODES:
>  			/* 6.4.4.3.3 */
> -			svdm_consume_modes(port, payload, cnt);
> +			svdm_consume_modes(port, p, cnt);
>  			modep->svid_index++;
>  			if (modep->svid_index < modep->nsvids) {
>  				u16 svid = modep->svids[modep->svid_index];
> @@ -1238,15 +1230,18 @@ static int tcpm_pd_svdm(struct tcpm_port *port, const __le32 *payload, int cnt,
>  static void tcpm_handle_vdm_request(struct tcpm_port *port,
>  				    const __le32 *payload, int cnt)
>  {
> -	int rlen = 0;
> +	u32 p[PD_MAX_PAYLOAD];
>  	u32 response[8] = { };
> -	u32 p0 = le32_to_cpu(payload[0]);
> +	int i, rlen = 0;
> +
> +	for (i = 0; i < cnt; i++)
> +		p[i] = le32_to_cpu(payload[i]);
>  
>  	if (port->vdm_state == VDM_STATE_BUSY) {
>  		/* If UFP responded busy retry after timeout */
> -		if (PD_VDO_CMDT(p0) == CMDT_RSP_BUSY) {
> +		if (PD_VDO_CMDT(p[0]) == CMDT_RSP_BUSY) {
>  			port->vdm_state = VDM_STATE_WAIT_RSP_BUSY;
> -			port->vdo_retry = (p0 & ~VDO_CMDT_MASK) |
> +			port->vdo_retry = (p[0] & ~VDO_CMDT_MASK) |
>  				CMDT_INIT;
>  			mod_delayed_work(port->wq, &port->vdm_state_machine,
>  					 msecs_to_jiffies(PD_T_VDM_BUSY));
> @@ -1255,8 +1250,8 @@ static void tcpm_handle_vdm_request(struct tcpm_port *port,
>  		port->vdm_state = VDM_STATE_DONE;
>  	}
>  
> -	if (PD_VDO_SVDM(p0))
> -		rlen = tcpm_pd_svdm(port, payload, cnt, response);
> +	if (PD_VDO_SVDM(p[0]))
> +		rlen = tcpm_pd_svdm(port, p, cnt, response);
>  
>  	if (rlen > 0)
>  		tcpm_queue_vdm_unlocked(port, response[0], &response[1], rlen - 1);
> 

