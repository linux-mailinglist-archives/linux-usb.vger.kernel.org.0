Return-Path: <linux-usb+bounces-36903-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NsOGLoo+WnS6AIAu9opvQ
	(envelope-from <linux-usb+bounces-36903-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 05 May 2026 01:16:10 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F26CA4C4C86
	for <lists+linux-usb@lfdr.de>; Tue, 05 May 2026 01:16:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E514E3026A82
	for <lists+linux-usb@lfdr.de>; Mon,  4 May 2026 23:15:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D415035DA4F;
	Mon,  4 May 2026 23:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OHUVOf2U"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B74370D4C
	for <linux-usb@vger.kernel.org>; Mon,  4 May 2026 23:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777936558; cv=none; b=OV0Ww6oxrrf5NfArjE2quagFNaA3nrJHzsrw/YokDUc0NmkJ4Me3zvkyQoIl0HORrpZJ//rTVCr3Nx/0GfPSieNieTItJ1SkMGovuZ7sHh4Xo9mIoDsoZMjseAziMr7z/Dz9BH+oXYr6HW3SzMogq2DHOT15O1oYGPb977izeWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777936558; c=relaxed/simple;
	bh=6kA5f8/Eq1uu4hnjHTbRSXA1fMelDXAzD0GtxiZTMBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k+aYNkQzDTYTFBJhfPW+x1Ey1FBeFd62bNxcRQ7YMoB4dDSa1zhsTfNsWo9tYgudn3L7C+MGydpgdFhhvCuHsDWCfptvsRWa5BjV3SNLtFkk0B/7S84yiJm3SWP+qS6Y1MQGWJb2ES3ee0IsXzGTUgKIYT+EaSr+44jsXEXNYos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OHUVOf2U; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-12c45281a06so7198547c88.1
        for <linux-usb@vger.kernel.org>; Mon, 04 May 2026 16:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777936556; x=1778541356; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uJUaPNEnLT6eI3Sz+OplXWx4CX0ycNqOaqliP4b8tDU=;
        b=OHUVOf2UM8g4vLb7uYSU6h5tYF5iG+pxFI2BhfjLj060+C7P68bEIfcaaEvlK4ZBSQ
         LL1JLXxMo6dQcxGpR4kfrMjmIzZeBOn3MXoq/Fp5YtHTMf6g3tzhSAOrOiYLccFDRE7X
         mwfOJKzvHMJOZXDFHM9nawoPZrwr24xEoxusT3zqkmJVTRqJjkLCT0srQB4zDVAf6uHU
         fB9TR/qUpJwAVKnZr+6vsaMMBXVqIZb1pNhURGF+nm86hFAd6xEhHPmD+rcbOAc0V492
         IU6esuFqC3h0BauoAMFynEWDIXlJ7kU4GeFaNGRkjJDY50+2ccRUgZGXRrOvuygPlKbd
         1plg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777936556; x=1778541356;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uJUaPNEnLT6eI3Sz+OplXWx4CX0ycNqOaqliP4b8tDU=;
        b=YA5KY4SbvQDd8vP6ZMOv0AZIRTpWRQH1VJTlMGRqTHaxRiXkAwTzE/XM99EYgVyzdd
         w94X9z9VgzqSpP02rnVlbzjuuYjlZwcSt68bykPY05U85IsX0ARRkfJTIIVEFsWuPWqv
         we5HyKit2JWiwbCbZICQ7NeBsfSgSIfMhUKT8eeUoKdB7gvRn5uO4btLO7QHCFRkF4gs
         aSB4N8VZJlZjntcC9haGDV7q7i2qlDnFaapbT4cb9lGoGd9yJZ/wauODERaxbYbrCkYx
         Qnofb3h2zZO4Nb2eY21jRJs9J0HUpfcQRDBv7ztpF5kV6Eyq1tNT/4TOPFcmadVZv0/m
         wyXQ==
X-Forwarded-Encrypted: i=1; AFNElJ+PHRIdALECUYyXyHbaCEUMdBep29STzLiF0Cxv1sidYKZxKa6d0CED7ZwexQvfYzOhw9n2m7C5jCg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHWwWD68d/wB7ov1ULcupu8FUq/iSwC9Z3rhKHnbGB+jayunKH
	SsfHFL3JJHuP2oGvanuJ1fQgHwQQEoGd6vnPcsAkOpwOXlRyO8C/e54t
X-Gm-Gg: AeBDievLSWROF/cKpKpAX+Nae3FuipVfofXzcbodePKmZy+cTphOmpl1WLhawHh8HEG
	N7jfl4S8JSZKQeqaAcGGqIYtbsUwTNZw9ATP7VnMp7ZALrvjSxGEweeODyXWG/DKbs2ZT02CIj3
	N+bvJR5nWGjUHXXFUHDywMzQ9QHhlrBzTcr7jVrmWXUqnICyefON2mcHLRNsrcOSphfMGa3hFUb
	f/wI1vue3vYOeWgpayMTx3z83qBua4ihrInYKbBTKSVbQDSeTAEm4BkwifC30snxqW3ItmT4mf/
	BwEzGS8PQZczbgU1q/3wsG73spuvCjjywxVQ8UDcPqj7qt/vzmmkRDQSfGLZ1NC8dTrYidZulFe
	bp+V9e8mhNMTC1D+i7nLZXMZgxeb07NIVLvwJ4nDDFMnRP0o7HRYM4HSYr83WwnIjOqwDGCounz
	tbe8sXMAdBW+Utj8mGhQJwvz0AprCKeeExGF9ILrXedz2hOM9HTfeLjeRvXpqfEe6Jov7dTzom9
	0wR+qnwpMKzLA==
X-Received: by 2002:a05:7022:605:b0:12c:8b9:7208 with SMTP id a92af1059eb24-130b1b67874mr477748c88.26.1777936556135;
        Mon, 04 May 2026 16:15:56 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:5b87:9b19:32e2:2981])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df84252c0sm20605766c88.10.2026.05.04.16.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 16:15:55 -0700 (PDT)
Date: Mon, 4 May 2026 16:15:51 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>, 
	Filipe =?utf-8?B?TGHDrW5z?= <lains@riseup.net>, Bastien Nocera <hadess@hadess.net>, 
	Ping Cheng <ping.cheng@wacom.com>, Jason Gerecke <jason.gerecke@wacom.com>, 
	Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>, Icenowy Zheng <uwu@icenowy.me>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org, 
	linux-staging@lists.linux.dev, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 4/4] HID: wacom: use __free(kfree) to clean up
 temporary buffers
Message-ID: <afknxbpP7oj4bNab@google.com>
References: <20260504-wip-fix-core-v3-0-ce1f11f4968f@kernel.org>
 <20260504-wip-fix-core-v3-4-ce1f11f4968f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504-wip-fix-core-v3-4-ce1f11f4968f@kernel.org>
X-Rspamd-Queue-Id: F26CA4C4C86
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36903-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Hi Benjamin,

On Mon, May 04, 2026 at 10:47:25AM +0200, Benjamin Tissoires wrote:
> @@ -386,10 +381,11 @@ static void wacom_feature_mapping(struct hid_device *hdev,
>  	case WACOM_HID_WD_OFFSETRIGHT:
>  	case WACOM_HID_WD_OFFSETBOTTOM:
>  		/* read manually */
> -		n = hid_report_len(field->report);
> -		data = hid_alloc_report_buf(field->report, GFP_KERNEL);
> +		u8 *data __free(kfree) = hid_alloc_report_buf(field->report, GFP_KERNEL);
> +
>  		if (!data)
>  			break;
> +		n = hid_report_len(field->report);
>  		data[0] = field->report->id;
>  		ret = wacom_get_report(hdev, HID_FEATURE_REPORT,
>  					data, n, WAC_CMD_RETRIES);
> @@ -400,7 +396,6 @@ static void wacom_feature_mapping(struct hid_device *hdev,
>  			hid_warn(hdev, "%s: could not retrieve sensor offsets\n",
>  				 __func__);
>  		}
> -		kfree(data);
>  		break;
>  	}

I'd recommend establishing a new scope for the "data", otherwise it is
fragile. If there was another label below then this cleanup would
explode since current scope of "data" is from the declaration point
until the end of the switch statement.

Having a dedicated scope makes lifertime explicit.

Thanks.

-- 
Dmitry

