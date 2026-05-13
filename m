Return-Path: <linux-usb+bounces-37401-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFhnL++jBGogMQIAu9opvQ
	(envelope-from <linux-usb+bounces-37401-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 18:16:47 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF91536E4A
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 18:16:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B6DEC300AD89
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 16:03:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FB644B8DF2;
	Wed, 13 May 2026 16:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mPiz8Pg4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801F438CFE9
	for <linux-usb@vger.kernel.org>; Wed, 13 May 2026 16:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778688213; cv=none; b=u1MqMG7862xsP4uohltJXeGECSjZDZZdK743vVOAmVbaE9aeS7CqiJ9WIVuoAgf813mcUJx1BUwArsIb44yhNTKNa2iFfohU5e5xt7KilNoJ1hmMuTN1tourRYxt3+PYIGSqoeFnVKDCsCPwY1FX+KNgGEGBvm+YjXvA5V11CDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778688213; c=relaxed/simple;
	bh=JGFe27ayqJrgDvDLhD1b2hmVt6TLkvhym5rDyUFlPcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TcQkyPJ26IlcTNmR8IpIsi5wLY8NrPPW71sDQ+ea9XhD2GSX4hdurocHUhB0xkLsjxUMQ0zjVaFL+acF5b14l0Bzbnu4qZDGMdRrfDQMEc4LpdgR7t36EOAgLgcJH8AHjXHBdj5Kd1ZrqR959PSDFUK/4ObxZtJ6TVyWDakVXLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mPiz8Pg4; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2ef8d6ba48bso4077729eec.1
        for <linux-usb@vger.kernel.org>; Wed, 13 May 2026 09:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778688212; x=1779293012; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8GjUElonfzwr8JtNy4IGQe2Hi118Ux3hgrDGmPVkXaU=;
        b=mPiz8Pg4JCgt0Hu9i3Vl16gAtUiDg9c/ifbVSXqBQHLwsEZZqQutz+S8ePb6p+apoB
         ME0Uu0qavCxHyDIsEoDEzd6PyCNLDRjpmRcYh3EbTARDv1F9lOgMPbMxyWsYEcZcd5ih
         53SMeXiEWHLteXhfPvTLqwgT+vGYDecgwUF953sepgvpzBfFCLRK0XmJubOvvhLPDQTr
         QGsyeCWbUxPmiJsqthYZIl1691udcBs9Nkyon053+hH4diYfmjIzjEG9EtjLvM2Djcx9
         Sgc15ksGEK2bZDGDncn2uxrhPFp8vT/cXrK2c93faIXkTwRXyFl5OWbVERD290LmbF0e
         OYSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778688212; x=1779293012;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8GjUElonfzwr8JtNy4IGQe2Hi118Ux3hgrDGmPVkXaU=;
        b=i6ngjgSIHqlWtIZB93EkgeCQaj+jmWsKFTRAHsuqjLwGZZCq9dZ3aAZDmczEvhksuJ
         2QuVYellwKxCHWqhn8CRVw8vV5Ypwh76MqZQGIeP54ORoQeeymWz5RZbyax+8t4HjueO
         zsBjYpE9kXamBnCBcqnsQP5sgj7BRNgEwb2y5px6kHxTg6jw7mJVU8x2K+27FUC64mbA
         MSuVuAZsyQor24caBi2gdkK4EOgp2JER/1hIUGxR3iLVDB/sifIFPUQ1PNndATuzLmFp
         NbiAkVVIft/Y0uTx3qCCqq45tOR2jAUN+yVmejHp4LaoMxYiRwQAzK3P6mIIzdEyKADR
         voHA==
X-Gm-Message-State: AOJu0YwoUFwD7mKbq3Ei2NarLsav1GEAoZ0/oASHcafBBlXaNIzQU/0Y
	zwcNWy5rC4m1cPjQsqzopiDY4uN8ZxPn8aqEsZhaL7vowGLk/jlRn7T9nadkemTxew==
X-Gm-Gg: Acq92OEJLTa694mf3NwV3tpAyDQ8xCsafiy35Uoy55KCRdvnjVK7umeGy0VHLa6cxFZ
	zTeNXEsBiL5uqIcz+y/2WrUW1lGufdtVt1yKzGPxDSzEfRqT1UAy4o7drnA9Y5yq3RbnvCcbUS/
	/H4uHSh+3qqf8XzSDtyyxpCnWLx0DlJjDvox19MWy14x9t5FrGE9H0g3qK/HMQOW4jPWKE6DPaI
	9JKId+wotgD5xnh6zrA/eN6RrLiRVWNEa249n7z9byEMpULyGMjzi73FbOY1gC5vQnbzebp6FZn
	Cyw+qqFtKMMkRGGjIb/K8EueqJzB2mzrH9TlOWSwuwa2sfALT+LVo6v2OzHTmt19TTT6nbjTJOG
	YZFQcscjaAmwbHh+yoyPZ7i8j25dDQJWQ5XMVRfPN9fqxZ2qBj9SQSyiCzQqUZyzEjB33yBmpGX
	A5Rere81S1A/+tzjMV4q3EgbyuevTl2LMPzDQ4ppeud2WPC3sOcYEY5lglrDfmi7Xzaqg=
X-Received: by 2002:a05:7300:bc97:b0:2be:17b1:e49f with SMTP id 5a478bee46e88-3025eaaf0cbmr79675eec.4.1778688208140;
        Wed, 13 May 2026 09:03:28 -0700 (PDT)
Received: from google.com (51.86.127.34.bc.googleusercontent.com. [34.127.86.51])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8893441absm30508496eec.31.2026.05.13.09.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 09:03:25 -0700 (PDT)
Date: Wed, 13 May 2026 16:03:22 +0000
From: Benson Leung <bleung@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Nathan Rebello <nathan.c.rebello@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Hsin-Te Yuan <yuanhsinte@chromium.org>,
	Abel Vesa <abelvesa@kernel.org>, stable <stable@kernel.org>
Subject: Re: [PATCH 8/8] usb: typec: ucsi: validate connector number in
 ucsi_connector_change()
Message-ID: <agSgyp6X1N_LQMd5@google.com>
References: <2026051347-clustered-deflected-9543@gregkh>
 <2026051351-truck-steadfast-df48@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Q9rVW+RxEkApF9Ak"
Content-Disposition: inline
In-Reply-To: <2026051351-truck-steadfast-df48@gregkh>
X-Rspamd-Queue-Id: BEF91536E4A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.intel.com,chromium.org,google.com,gmail.com,kernel.org,intel.com];
	TAGGED_FROM(0.00)[bounces-37401-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[google.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bleung@google.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:email,chromium.org:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Action: no action


--Q9rVW+RxEkApF9Ak
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 13, 2026 at 05:52:55PM +0200, Greg Kroah-Hartman wrote:
> The connector number in a UCSI CCI notification is a 7-bit field
> supplied by the PPM.  ucsi_connector_change() uses it to index the
> ucsi->connector[] array without checking it against the number of
> connectors the PPM reported at init time, so a buggy or malicious PPM
> (EC firmware, or an I2C-attached UCSI controller on the ccg / stm32g0 /
> glink transports) can drive schedule_work() on memory past the end of
> the array.
>=20
> Reject connector numbers that are zero or exceed cap.num_connectors
> before dereferencing the array.
>=20
> Assisted-by: gkh_clanker_t1000
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: Benson Leung <bleung@chromium.org>
> Cc: Jameson Thies <jthies@google.com>
> Cc: Nathan Rebello <nathan.c.rebello@gmail.com>
> Cc: Johan Hovold <johan@kernel.org>
> Cc: Pooja Katiyar <pooja.katiyar@intel.com>
> Cc: Hsin-Te Yuan <yuanhsinte@chromium.org>
> Cc: Abel Vesa <abelvesa@kernel.org>
> Cc: stable <stable@kernel.org>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>


Reviewed-by: Benson Leung <bleung@chromium.org>


> ---
>  drivers/usb/typec/ucsi/ucsi.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index 5b7ad9e99cb9..539dc706798d 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -1380,13 +1380,22 @@ static void ucsi_handle_connector_change(struct w=
ork_struct *work)
>   */
>  void ucsi_connector_change(struct ucsi *ucsi, u8 num)
>  {
> -	struct ucsi_connector *con =3D &ucsi->connector[num - 1];
> +	struct ucsi_connector *con;
> =20
>  	if (!(ucsi->ntfy & UCSI_ENABLE_NTFY_CONNECTOR_CHANGE)) {
>  		dev_dbg(ucsi->dev, "Early connector change event\n");
>  		return;
>  	}
> =20
> +	if (!num || num > ucsi->cap.num_connectors) {
> +		dev_warn_ratelimited(ucsi->dev,
> +				     "Bogus connector change on %u (max %u)\n",
> +				     num, ucsi->cap.num_connectors);
> +		return;
> +	}
> +
> +	con =3D &ucsi->connector[num - 1];
> +
>  	if (!test_and_set_bit(EVENT_PENDING, &ucsi->flags))
>  		schedule_work(&con->work);
>  }
> --=20
> 2.54.0
>=20

--Q9rVW+RxEkApF9Ak
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCagSgxQAKCRBzbaomhzOw
wlHBAQDJjG1456DeAQFOqLK9/1KhIJUg9qm2ZIbmXsGMDJnewwD+PoOeQRgvdpgJ
H4/HROlOclqaqunCQ+raDJQPpqw04Ac=
=iAsP
-----END PGP SIGNATURE-----

--Q9rVW+RxEkApF9Ak--

