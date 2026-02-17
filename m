Return-Path: <linux-usb+bounces-33412-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QAjpAPKblGmrFwIAu9opvQ
	(envelope-from <linux-usb+bounces-33412-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 17 Feb 2026 17:48:50 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B69D14E67F
	for <lists+linux-usb@lfdr.de>; Tue, 17 Feb 2026 17:48:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 340E030416FB
	for <lists+linux-usb@lfdr.de>; Tue, 17 Feb 2026 16:48:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C10936F400;
	Tue, 17 Feb 2026 16:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=u-northwestern-edu.20230601.gappssmtp.com header.i=@u-northwestern-edu.20230601.gappssmtp.com header.b="QzQzXVYF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6D336CDF5
	for <linux-usb@vger.kernel.org>; Tue, 17 Feb 2026 16:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771346906; cv=pass; b=HMZR/abFqniaN9KQo0AlEdbfQPh6vDq+INYr8YjdiGczttigdprczafQl3AJJuv5eTCRxLXV4rhDr+Aw8IBim4bpwncBzA5qcdvhHM607B6s6wi7bGnH8hoBeQDq/ZqFkW38q4Tu/smBLgH8N3wHYJulKSD5VRaRatta6y6Ysps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771346906; c=relaxed/simple;
	bh=x8lmkK8Z+Mhh81BsN5M5VArNcC6K8Rk9DEJnryMwc28=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pQk2/oZ4WFT8TQUxRiikXnlf8tx6QjemnVgxS16zEaMHuiVizECiSk6CHHn9cifmMW9FqJPfqsmeXVgogUYdPIFWBAvVWG8abkpX1lpI+ZondG6ZJF7lDQ6dYiMclSzjD5nvQ36A54UNTgDS4L3MetQh5N1nCbE/6wfIBmeZeiw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=u.northwestern.edu; spf=pass smtp.mailfrom=u.northwestern.edu; dkim=pass (2048-bit key) header.d=u-northwestern-edu.20230601.gappssmtp.com header.i=@u-northwestern-edu.20230601.gappssmtp.com header.b=QzQzXVYF; arc=pass smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=u.northwestern.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=u.northwestern.edu
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-46390d4ac7bso2645593b6e.0
        for <linux-usb@vger.kernel.org>; Tue, 17 Feb 2026 08:48:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771346904; cv=none;
        d=google.com; s=arc-20240605;
        b=ldvPJRL2AjO4vaGZ5++Jb9yRkWLvqiEKeDNSnyNKQaZFFSNFrDhSYIE3EjkCnfpolG
         7YbMJkYXSYXhkKCNsK4nJBc0xw35+ob28vwDCyVyL6vG4tangkMDV4/5UnNIaK/ttk9B
         NQkHZY+OhE9Vuk8/4jG6qa/PHgPqu4LxHEyV9Oa5pKi4P+IxyHX9/IirX2xfuh4Y7RR5
         cE+RfaIEIBCbHMCGt9NXKUVm/h259xeOZTUhknTidj1kh5InA8vApNwvtPqubEwaUK9a
         z88Qqcoj939zmR0+sgP18DjU4g9X0yWIWBh3yAjSOn4LIB5izLsLWYTL3wwhHiU4jBk4
         Ba/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x8lmkK8Z+Mhh81BsN5M5VArNcC6K8Rk9DEJnryMwc28=;
        fh=rnMTHNNv6nYGJQTqIwXdufzW4evsY7qI3aPTeexuVho=;
        b=dVLNTuzT3GlkLPhu1hntgBp5BRVpG00/2vidNrlenimBkmNr6qFOOyY++1zw5zszRe
         Wq5YhUuSQUSubkfQVJzR+95EXSx5d6beLLPSS7X1jz/jqxOx1FRteWJShN1fIpe5HQ9n
         8O3AIVQw5kW5Jady7u+IMKASYX9tyC9VQmEPt6+eXFyhQdcQWGyWMFfPalFPtK2Dz69q
         Pt7qygj34wljVnQ+UYe70MV+f1kj8MeWGLZwKBo3QAgSbBj19xXvWmzAwfGr2i+DyzS9
         wTQeWfUgf7of3GoHC4p21FcmISccBPf4eETHdlNNHv/0eBYrA1JFWj3S6qIN20T0CU9J
         iMgw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=u-northwestern-edu.20230601.gappssmtp.com; s=20230601; t=1771346904; x=1771951704; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x8lmkK8Z+Mhh81BsN5M5VArNcC6K8Rk9DEJnryMwc28=;
        b=QzQzXVYF/1OEsitoUdgFjGBzz02recZS7BzmNMBX8E7ngMQfrW6LzWry5t115DoE3M
         MMbnzJ7s5//dq4HmYBULCjaFbCAvQRrdACYf1qfgcW4rrn5VgNIs8psRJ22emce1ZCh3
         wyPiStn57rsqrzmqyrdfXVVjd03HO6+Hlf8wOmnIL06zT6Zia1U21VY7RUNRHpnZfM9e
         yLkhnHHZL8qdri/BZTVD9KsthDfVdUntOSn+jEcKqQkJtvM7azQyLRyOW+1rIAea7odC
         Ng4xWk9aHKA7MYZKMZW7tORLxLTP4yUa839owJ9JSPomqatiwYCeXsQ+ur2KP8rNH64u
         GXZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771346904; x=1771951704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x8lmkK8Z+Mhh81BsN5M5VArNcC6K8Rk9DEJnryMwc28=;
        b=HftiLzdlEcLbfVq3aqcQjDZIF1ys4OrLuTalpHWy8zsc6hpZL7jE0/jLXGeDb9Lgp3
         7O4EUo9vgj7BDAUR9PN+0mX6UWknX4T+zXYhrg0MjOFFebL2BQG+o/3JVt4FWemj1q75
         UT6bGZYtmaRfG4Yc/ksr0dbdCJphzw3yihxbxjGcbiHxQ/nYXa6xudwfj+TNNAW9Kdo0
         p6pj4C0XRPR4CruUW6L9m0CBYQhYjkt4MqfpzOItQppEwOPdVBLgvC9XEZbGbFn2PH6e
         2qzU7E8R/iZM2VEZVSoxGcuDvLZXGmTXVD7ohIuA57JSS+zXQQ6VcBiBgoNkkc8Z73Cl
         kHVQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4U3OktJeWdUkLSgxpRysXZntsLbow6hia2rmvF6HBf+ON5v9EtPTCmunrkrMbZslyW5aDizHMvG4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+p5MI0XVD2silLAxMHRXD2lt55+Hsgfh1HZHA94AHhF9evAoa
	IEJgX+cBeFK+Tvl4Mn7jHWQnMKVKoBBQmxtU9oEJWHkjwlZTwicr3LVAljn7uK9PQpqsii90tj0
	s02PhA2kIyitt6ebHvh+qEIQx+QNF67ZB0uCCvQ/xRA==
X-Gm-Gg: AZuq6aLcMWm6KGJn/dwxKvzVIEPu87tAR2zzFAgyRwRNRfxQzP/+/duI3BCls4+4nZv
	DhNVOFC7xpl/hPz9e93FmEaR1PQf5NIRWYFbiHc4C3MsY3j8sWVavw2IIyhGlJ+DVhcLdKnmA2x
	ofKd8Dc1BNcS+CdOeo2pussosfRwVvsY0sak62rjndQMRcJZwpeHcB3VBGlvVeh8s1YKNTgnbQD
	evfi0s6SKJ52SbJ5V0A7W3ZMfc2VvnH8201VFhgT4YJOsNTDI5aEEITYBPKrSNJ/mmtxs+b25dd
	lXvAHLP7VX5Wi19a15WyYzJHb3PQROUEfL3kXbF5AN7gen5l/nXrr0o1hZKitZlzGELWlG7GDQ=
	=
X-Received: by 2002:a05:6808:1208:b0:451:4cc3:912f with SMTP id
 5614622812f47-4639eebef6emr7303805b6e.7.1771346904143; Tue, 17 Feb 2026
 08:48:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209053013.1701134-1-n7l8m4@u.northwestern.edu>
 <d697a88f-dd8c-4ec1-ae4d-c97578a98498@lunn.ch> <CAMFT1=bFkHFsh-3U+Ca7Dey1mzPdz0rpQweCLmXFrattwZ_uMw@mail.gmail.com>
 <119e20b9-4ecd-480d-b629-1c57b2088a41@redhat.com> <65665dd2-90ee-4f52-9238-55ef79832967@redhat.com>
In-Reply-To: <65665dd2-90ee-4f52-9238-55ef79832967@redhat.com>
From: Ziyi Guo <n7l8m4@u.northwestern.edu>
Date: Tue, 17 Feb 2026 11:48:13 -0500
X-Gm-Features: AaiRm500f0v5aRhtJGmxgFt3WT-gB1Yh-Z-L_IP4NgW6HPMHGVpCSq9goY6JB_o
Message-ID: <CAMFT1=ZfO6QkDKbwM6GPL-DS1CcJ0pQEwz2XsCUUt8fJQS6yaw@mail.gmail.com>
Subject: Re: [PATCH] net: usb: kaweth: remove TX queue manipulation in kaweth_set_rx_mode
To: Paolo Abeni <pabeni@redhat.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, linux-usb@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[u-northwestern-edu.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[northwestern.edu : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33412-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[n7l8m4@u.northwestern.edu,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[u-northwestern-edu.20230601.gappssmtp.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,netdev];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,u-northwestern-edu.20230601.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: 5B69D14E67F
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 3:56=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On 2/17/26 9:50 AM, Paolo Abeni wrote:
> > It looks like kaweth_set_rx_mode() is already functionally broken: the
> > real set_rx_mode action is performed by kaweth_async_set_rx_mode, which
> > in turn is not a no-op only at ndo_open() time.
> >
> > So this looks safe to me.
>
> @Ziyi Guo: I'm sorry I'm low on coffee and I did not notice a couple of
> relevant things. This needs a fixes tag. Also please specify the target
> tree ('net' in this case) on re-submit.
>

Hi Paolo and other folks, thank you so much for your time and review,
and sure, I'll revise and send a v2 version patch, with the fixes tag
and target tree.

