Return-Path: <linux-usb+bounces-7570-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4EC872708
	for <lists+linux-usb@lfdr.de>; Tue,  5 Mar 2024 19:54:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 524071C2457C
	for <lists+linux-usb@lfdr.de>; Tue,  5 Mar 2024 18:54:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BED971B809;
	Tue,  5 Mar 2024 18:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="My9YfPPF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BF81AAAE
	for <linux-usb@vger.kernel.org>; Tue,  5 Mar 2024 18:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709664883; cv=none; b=CUBNK7+wgurOt4H+uUagjLtl4IJtgwOwsmEiN1NBUym1+8QG/JNPY+lmabU2FwhTIvp7HUvW2w8015qCoZmqdJdfpq4+pG6YD/7X+yxx3DCM3FaK4cq4IomiucDivHTNamT/6y2OnoP8cNsOz5KLvKf3JFNW2gnJX5WUsWiteEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709664883; c=relaxed/simple;
	bh=vSbegJ/mfKJlAVFDjG5b7omrS1QW3UlmocGh5VJ7JEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aDzZdDcOdZJ3HmotsycC8bnsLnR/8cyt9j/jLuzgYAeiPn9ItbIWxXL6OpMZZTnmyQLmautQkSnys0eQWcP/am8CSNwLHvajPblpRfoeZt3TT4sn4F0u4jyE+BXNukgwJuzYhyrpO4LInN96E1zONx27U9Ryn7uuAlfKEzW5fiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=My9YfPPF; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1dc5d0162bcso52199295ad.0
        for <linux-usb@vger.kernel.org>; Tue, 05 Mar 2024 10:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709664881; x=1710269681; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=smEnDw1iDeBsm7OWKZul3/JCo3QrVo/nFFRvio7e+IU=;
        b=My9YfPPFtj84Ezs5+jqbZ3TkvsEBG7SUfW71+KXSgXoxmP1Ga6bgP+/BXzW2PSnmj0
         unhiLceJrOaPH8pjJGeqSG64ispIHC6U/Z5GmQVeizqKeuHfksR9xeo/OOzSe/2sEPeF
         uoxAXvCbXkGaOBluYkmVro44H/jA4MuSVd/q4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709664881; x=1710269681;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=smEnDw1iDeBsm7OWKZul3/JCo3QrVo/nFFRvio7e+IU=;
        b=TxFc6qg3kS9YiY+GwTbEACXQLOuYTrXvUiEMzTTmVO24Vic4iKu79Q/mUcQpf/imUS
         7tobqPTexHJfivVmrKanVihtu/vlDd6VhUgHEQQbHvrnzV7Sk19osnSf1tAcN8Mruwgf
         gjczly1BZUlIAJjlgJTzphN8CsO1pHIPi2ocMak5B3jnNabhH20/RC+r5WVhchb87QvD
         0M6mxeLr4EDSBLdqHAwimOCngiarWNtMVNHqZ6sZtG8GOhr9cZLevd9wHWrkmY+0B9jl
         BTi4jbIA5395+j4gcs8s3OoL46aqUIUsoj7/YwF5gjUWd8AAgY/MSL6/q9qI3Exzpily
         P3bQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/SJGrp7fnCUA0KY3Fog3GyM8f02KiPWCzvkxt6N6Js2V3zM35vuUdWKFOWi6NhykSiYkXnzsp7+rZpRZCo6qjqe/GBCSYx/Xb
X-Gm-Message-State: AOJu0YwXhDgtqY9QZORiwdPSexrLuATu8EtwrU1jDDTgX0ZVtAbRuo+B
	MWAShRMGIRderQIyOxnLAh5egOg0zMX6mBPj4NJ2Ek5xT9gek2cKh0Vtz5VJLA==
X-Google-Smtp-Source: AGHT+IFQ/JUjhZlOOudg5Vl14EDqM//GwJuL9aAWqrRTcOFpZJnoov8OawOP5MFzqtbq2hPtIZRiEw==
X-Received: by 2002:a17:902:6b07:b0:1dc:f7cb:bbaf with SMTP id o7-20020a1709026b0700b001dcf7cbbbafmr2523098plk.22.1709664881047;
        Tue, 05 Mar 2024 10:54:41 -0800 (PST)
Received: from chromium.org (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id x15-20020a170902ec8f00b001dcb654d1a5sm10886409plg.21.2024.03.05.10.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 10:54:40 -0800 (PST)
Date: Tue, 5 Mar 2024 18:54:39 +0000
From: Prashant Malani <pmalani@chromium.org>
To: Jameson Thies <jthies@google.com>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org,
	bleung@google.com, abhishekpandit@chromium.org,
	andersson@kernel.org, dmitry.baryshkov@linaro.org,
	fabrice.gasnier@foss.st.com, gregkh@linuxfoundation.org,
	hdegoede@redhat.com, neil.armstrong@linaro.org,
	rajaram.regupathy@intel.com, saranya.gopal@intel.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/4] usb: typec: ucsi: Register SOP/SOP' Discover
 Identity Responses
Message-ID: <Zedqb6_fe0GoUR9U@chromium.org>
References: <20240305025804.1290919-1-jthies@google.com>
 <20240305025804.1290919-4-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240305025804.1290919-4-jthies@google.com>

On Mar 05 02:58, Jameson Thies wrote:
> Register SOP and SOP' Discover Identity responses with the USB Type-C
> Connector Class as partner and cable identities, respectively. Discover
> Identity responses are requested from the PPM using the GET_PD_MESSAGE
> UCSI command.
> 
> Signed-off-by: Jameson Thies <jthies@google.com>

Mostly line splitting nits (which I have listed below). Once those are
addressed, please feel free to add:
Reviewed-by: Prashant Malani <pmalani@chromium.org>

> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index 7c84687b5d1a3..3b64a0f51041c 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -646,6 +646,108 @@ static int ucsi_get_src_pdos(struct ucsi_connector *con)
>  	return ret;
>  }
>  
> +static int ucsi_read_identity(struct ucsi_connector *con, u8 recipient,
> +			      u8 offset, u8 bytes, void *resp)
> +{
> +	struct ucsi *ucsi = con->ucsi;
> +	u64 command;
> +	int ret;
> +
> +	command = UCSI_COMMAND(UCSI_GET_PD_MESSAGE) |
> +	    UCSI_CONNECTOR_NUMBER(con->num);
> +	command |= UCSI_GET_PD_MESSAGE_RECIPIENT(recipient);
> +	command |= UCSI_GET_PD_MESSAGE_OFFSET(offset);
> +	command |= UCSI_GET_PD_MESSAGE_BYTES(bytes);
> +	command |= UCSI_GET_PD_MESSAGE_TYPE(UCSI_GET_PD_MESSAGE_TYPE_IDENTITY);
> +
> +	ret = ucsi_send_command(ucsi, command, resp, bytes);
> +	if (ret < 0)
> +		dev_err(ucsi->dev, "UCSI_GET_PD_MESSAGE failed (%d)\n", ret);
> +
> +	return ret;
> +}
> +
> +static int ucsi_get_identity(struct ucsi_connector *con, u8 recipient,
> +			      struct usb_pd_identity *id)

nit: Line limits are 100 now [1], so this can fit on one line.

> +{
> +	struct ucsi *ucsi = con->ucsi;
> +	struct ucsi_pd_message_disc_id resp = {};
> +	int ret;
> +
> +	if (ucsi->version < UCSI_VERSION_2_0) {
> +		/*
> +		 * Before UCSI v2.0, MESSAGE_IN is 16 bytes which cannot fit
> +		 * the 28 byte identity response including the VDM header.
> +		 * First request the VDM header, ID Header VDO, Cert Stat VDO
> +		 * and Product VDO.
> +		 */
> +		ret = ucsi_read_identity(con, recipient, 0, 0x10, &resp);
> +		if (ret < 0)
> +			return ret;
> +
> +
> +		/* Then request Product Type VDO1 through Product Type VDO3. */
> +		ret = ucsi_read_identity(con, recipient, 0x10, 0xc,
> +					 &resp.vdo[0]);

nit: Can fit on one line.

> +		if (ret < 0)
> +			return ret;
> +
> +	} else {
> +		/*
> +		 * In UCSI v2.0 and after, MESSAGE_IN is large enough to request
> +		 * the large enough to request the full Discover Identity
> +		 * response at once.
> +		 */
> +		ret = ucsi_read_identity(con, recipient, 0x0, 0x1c, &resp);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	id->id_header = resp.id_header;
> +	id->cert_stat = resp.cert_stat;
> +	id->product = resp.product;
> +	id->vdo[0] = resp.vdo[0];
> +	id->vdo[1] = resp.vdo[1];
> +	id->vdo[2] = resp.vdo[2];
> +	return 0;
> +}
> +
> +static int ucsi_get_partner_identity(struct ucsi_connector *con)
> +{
> +	int ret;
> +
> +	ret = ucsi_get_identity(con, UCSI_RECIPIENT_SOP,
> +				 &con->partner_identity);

nit: One line please.

> +	if (ret < 0)
> +		return ret;
> +
> +	ret = typec_partner_set_identity(con->partner);
> +	if (ret < 0) {
> +		dev_err(con->ucsi->dev, "Failed to set partner identity (%d)\n",
> +			ret);

nit: One line (100 is the limit now).

> +	}
> +
> +	return ret;
> +}
> +
> +static int ucsi_get_cable_identity(struct ucsi_connector *con)
> +{
> +	int ret;
> +
> +	ret = ucsi_get_identity(con, UCSI_RECIPIENT_SOP_P,
> +				 &con->cable_identity);

nit: One line.

> +	if (ret < 0)
> +		return ret;
> +
> +	ret = typec_cable_set_identity(con->cable);
> +	if (ret < 0) {
> +		dev_err(con->ucsi->dev, "Failed to set cable identity (%d)\n",
> +			ret);

nit: One line.

Best regards,

-Prashant

[1] https://github.com/torvalds/linux/blob/master/scripts/checkpatch.pl#L59

