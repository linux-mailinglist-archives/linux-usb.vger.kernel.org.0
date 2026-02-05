Return-Path: <linux-usb+bounces-33127-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YK3EI1D7hGlC7QMAu9opvQ
	(envelope-from <linux-usb+bounces-33127-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Feb 2026 21:19:28 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EC7F716C
	for <lists+linux-usb@lfdr.de>; Thu, 05 Feb 2026 21:19:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9F86A3007A48
	for <lists+linux-usb@lfdr.de>; Thu,  5 Feb 2026 20:19:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70A7A32B9A8;
	Thu,  5 Feb 2026 20:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="giMzrAm8";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Jcop9g+s"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FED313E34
	for <linux-usb@vger.kernel.org>; Thu,  5 Feb 2026 20:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770322760; cv=none; b=M5r6sVigme//pJ2gz03SH0xTpLkWQ6E/l+8ac/x75IXdiBS++PIISK8pP/FI7rDwrsxJ8Aai7Bau5cAScudjFW/ro+KVJKsRaq+92AGb12BGEd5TkvOBvMWgcAmlrMtHsT2jMRVH90dZMevtC0/GGMau2p11Pg1I/qWkoP6C+u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770322760; c=relaxed/simple;
	bh=DsoxQgc5pCcsXGuwDsUXoZOtZTnk/Juhsk0yC5+b2bY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fnAk9FM85FS/BOLp0dXxBmm9BTiSyXf8nVOsJSqFYGPwCnWNeiTvagrP/M33NmZRiuSOKczP4Q6KVHSGGsbpS8trtIrdiiMi8m7Kpe1DOttoQdVs2BEur11gM2zxyX+7C+BWYQXB0pNq6Q//KSInbw6Z4tJrxyKRbVo3ZNEbkl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=giMzrAm8; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Jcop9g+s; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770322758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NuT6LLwqGDvmYluz43KFP43fQri8NIHs2DOVJWu/Qqo=;
	b=giMzrAm8AIhVnUWidypXXeXgUXzvmYM9FL4NwqBLkYyaD0QAYKcKHYLO94E+JY38MSUBkV
	OxXPoWVi/0HH7sOJtSkjdd+cc5eyNG1oVXFR/NvNMMfHrqFSNlq8VOk2/z0nmQl+WOkkQR
	9lan4CHMAcolG+Pc+JiDz30AStNIlD4=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-U0Zh1K6tN6-393Jsz16kxQ-1; Thu, 05 Feb 2026 15:19:17 -0500
X-MC-Unique: U0Zh1K6tN6-393Jsz16kxQ-1
X-Mimecast-MFC-AGG-ID: U0Zh1K6tN6-393Jsz16kxQ_1770322757
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8823f4666abso42019216d6.0
        for <linux-usb@vger.kernel.org>; Thu, 05 Feb 2026 12:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1770322757; x=1770927557; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NuT6LLwqGDvmYluz43KFP43fQri8NIHs2DOVJWu/Qqo=;
        b=Jcop9g+s139nlAziobtSC6+2cvycz71R1YZjixMUKbsb1gMwhuWdydHlGIhuQ0PBG9
         U8RLuc5GdkDjL2PdIn13Tp4pAGTSiEjRbhw3+Z0DjCiFkjoHCrIomF4HBRswnasuJFn1
         eqDp6NUzlmnLAJK4re0t8CRi1bCx+o9ISfsmlPUxUaQbY9HDgWJnv1IxBpKbH/raCqBB
         5XS6G3PbUK4z4aLD0laFhy7DstNDTYs/zeapAh944tvhKMEKLqT51bldCHljQFWFLOPA
         mlkgNQbkk+NnZc2Amcy1BA6j8pNsBegjqnyKRqtEAm2Fq1wBlKZQFcO33C7Mz61Cbtuh
         BwVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770322757; x=1770927557;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NuT6LLwqGDvmYluz43KFP43fQri8NIHs2DOVJWu/Qqo=;
        b=iDjE/kq9Gj7HyfSUjuu8I1bg8UERshvlK2QyBcU0Yd7hPYJe5dOyMQnBAVsqOUwDfT
         qjdzoeOQSokMewbuDsg7r37Zyjayk8vJuQALSQSttDAPf0QYJruWNADEpJZ20HPpOz30
         PM4VHN1JqR9HesoOcMm0AjXl/gNfDU0pONa7ySPMOhGKaYqLNGwV9MmxbUxYL0SwtOz8
         rMr7sqfHVngqDd2uhPI1M8KlacV4RtFNtXh/0y5Xe1+1HtHvqQW4xgdWqFErFuP8mkXr
         qHKBfNtvb6/Uaf2F/UgKlTlVQw6lMMgzuy0lDcsrgb5zfblPySVWNFidbZL7cAurHpu+
         QVcg==
X-Forwarded-Encrypted: i=1; AJvYcCUiC2IlVi1uFK7wD1pGgFl7syYXfENLF1UCS+ZY0EYfg+wer+2dM0zk0YVhw7PiOBYq9iP3Z0txlhQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz12fQ8f4onpCQt9WTtSzBsau9ujbbKd2fEBRU9Jxyu0wB5OINc
	2QJNnLEG0t3w7bRYssGAUSBGs9ZDkTYKp7koq8/Lhx03hYRypKCIyIudI6AK6jwcebJOXleZaau
	MZfuHw7A9i8/eo4hgT1KRu2twCIAHPBjlthAPMaWwjJaHfgHkAIT8KQcctqWh/Q==
X-Gm-Gg: AZuq6aICjHGsdJqlT8GAY2FuI6inwIRp90kE7JWBGmBG430KXH1mA0qEtJgQ4eocZxh
	a+ffz4kGomeaBCfaQq06NtHSRDVJdmTnOori3XtcEqWSUVplvL4XV9MwcOkBu+q7d1WpXPBZlw3
	rgFBgFX78zYK0gH2WhfzuyE4nQVvTzxDWL8xF1hR1JAMGBBfYvayb3T7LFCuP6zZfouWJDHmBAb
	Yasyl5ti4wBCvf/7sJrYankL/1l7o+U/roagezoPlrnyRtNv+pfgxmaaKjmMKWUU/Pl/duBKHeb
	3QGKJfv7UVqJi151vL2MXu8MnqfrgyZTW8rKcocZphBnt1SnAnyG05T5WevkIwDOp63xHfYT7tm
	cwvx5vw==
X-Received: by 2002:ac8:7dd2:0:b0:4ff:c61a:c8a5 with SMTP id d75a77b69052e-506399cb147mr5383251cf.49.1770322757172;
        Thu, 05 Feb 2026 12:19:17 -0800 (PST)
X-Received: by 2002:ac8:7dd2:0:b0:4ff:c61a:c8a5 with SMTP id d75a77b69052e-506399cb147mr5382851cf.49.1770322756753;
        Thu, 05 Feb 2026 12:19:16 -0800 (PST)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-506392c3f5esm2848731cf.26.2026.02.05.12.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 12:19:16 -0800 (PST)
Message-ID: <8df2bbe58e7d252c72af38db678817395a83aedb.camel@redhat.com>
Subject: Re: [PATCH 1/1] usb: core: Add quirk for Gigabyte Aorus Waterforce
 X II AIO coolers
From: lyude@redhat.com
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, Jiayi Li	
 <lijiayi@kylinos.cn>, Mathias Nyman <mathias.nyman@linux.intel.com>, Oliver
 Neukum <oneukum@suse.com>, Miao Li <limiao@kylinos.cn>, Johannes
 =?ISO-8859-1?Q?Br=FCderl?=	 <johannes.bruederl@gmail.com>, Lei Huang
 <huanglei@kylinos.cn>
Date: Thu, 05 Feb 2026 15:19:15 -0500
In-Reply-To: <2026020403-federal-smite-0740@gregkh>
References: <20260203221452.198682-1-lyude@redhat.com>
	 <20260203221452.198682-2-lyude@redhat.com>
	 <2026020403-federal-smite-0740@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,kylinos.cn,linux.intel.com,suse.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-33127-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lyude@redhat.com,linux-usb@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: C1EC7F716C
X-Rspamd-Action: no action

On Wed, 2026-02-04 at 06:16 +0100, Greg Kroah-Hartman wrote:
> >  USB_QUIRK_RESET_RESUME },
> > =C2=A0
> > +	/* Gigabyte ITE Tech. Castor3 (Aorus Waterforce X II AIO
> > coolers) */
> > +	{ USB_DEVICE(0x0414, 0x7a5e), .driver_info =3D
> > USB_QUIRK_RESET },
>=20
> Please see the comments for this structure on how to place this
> device
> in the list.

aha-whoops, my bad :). I'll respin a new version in a bit
>=20
> thanks,
>=20
> greg k-h


