Return-Path: <linux-usb+bounces-33911-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDabMyPupmlKaQAAu9opvQ
	(envelope-from <linux-usb+bounces-33911-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 03 Mar 2026 15:20:19 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1167E1F1527
	for <lists+linux-usb@lfdr.de>; Tue, 03 Mar 2026 15:20:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 00265307B21D
	for <lists+linux-usb@lfdr.de>; Tue,  3 Mar 2026 14:14:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A963F35CBC4;
	Tue,  3 Mar 2026 14:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k+eWEJNV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39229383C9D
	for <linux-usb@vger.kernel.org>; Tue,  3 Mar 2026 14:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772547255; cv=pass; b=co8RrunEoO0Mkz1eClMC1/c2tsXxbtyHBirf0K0KD7PYnevT8Rq1txhD8dIvdS+mjrPBhX+hAl2C/JCarRUOaDcdCW7qsJ+lOhekZ7OLHskJ8th9Dlj0Bec0UoanB2CFiJ+z51uOGxLdDcyT48X/cqVN8zIVJiOwVFCbpCIbCaI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772547255; c=relaxed/simple;
	bh=t6SW1sm9M982cFygq5eOtkLajRDKQSWqroBktqJfdBI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ftZG8egDaK8LA/iYOG3bxhRMqbzJ4uTcTqhr4R1hoeSPtlEfngHwAS6N2gXzy5si+WtDIOVsifwZVYnvlwpOx0NhE8h0xkrVVt6dhxrxVRV9zkvh3STJToiTxDn/toqhUNcJcwcibjwaZInbcYQwTKwHgtsOqWgWI/5WdB5BiSY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k+eWEJNV; arc=pass smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-38706f96202so71280171fa.3
        for <linux-usb@vger.kernel.org>; Tue, 03 Mar 2026 06:14:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772547251; cv=none;
        d=google.com; s=arc-20240605;
        b=YX1sqsekMpjjJn76+7Zvq7RX1yJkzjUhc18kvnTk//aDWtYsBoq9NG9lvjaSMQUAIa
         L0Sh+Clr0UJyO4fAew7/FzlVkX6l1yelviOkrk7+l1WZCU4a0W1fjo0tedyWvN9lOWQr
         MnJwiKntGLwkfSCXo0E6R41SHJFBVaV0cOFxZlU8l5n6AhwwfR3ocWLUv3nnzqk+Uf/G
         jvPAfhU82pPCvQkPIpG4EfKpUuN5lYl2eeoKeqskTFmPgUAgCOgBmWwV1v6/HOyWeyOK
         aQnBwZs3tT/ZnBRPPLy+vnxwRJjpzVHC4QaHOAtmwHTIWW92Ruh08Yez3GXgd794EmaU
         TP3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UsdCJXnxkTNbIWbjZLNJ5b3UIxV8qEBiWBR+b3b28Jk=;
        fh=Nf5nFnrTBMmSHiCeyz+NcekYfqrN1h2RNzbUwl2RCRk=;
        b=c2D+KBuU7kdzoRdcEjwCRmtQBFunOmydSzrfx2hfqnc0/0UriTu5T6rJDptD7wkVum
         ncwBY8a+31mhlNNIIJCyX9KJ2dqRCaA6DGEWQWOAtvkpol78H6j63KXT8oPnjT9SDvEz
         wAMJ1d+xMju9QB1Vl2F//dVhLBWGmupqeYi5FlDqr9ny76oJoRkuwcqQwuJG6uaZqV7i
         7V9HWWV9dnZw0s5zbfWSXwLNp/xGICYXZowE80JDiGd2uzV599EWtX04nRH3jFdSf3R3
         ThjmeVQTe/MQMqvR56Hl3MMeOOKZUXjWTTGkwEosd0fjlVXx/QSJ3bLPgBFU93w6Fkiv
         77rg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772547251; x=1773152051; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UsdCJXnxkTNbIWbjZLNJ5b3UIxV8qEBiWBR+b3b28Jk=;
        b=k+eWEJNVevZvzopakfK36IYbjH/G2NYRPhiV13v2J25QdIPNgErR1OrsSaAq9lR9FD
         PqM+KdPGy+UAqV3PuKjW5ryQoVNblXfXLSf/l+PL7YfxcVuPYpyvJEyfjKWG5fXJ8OSt
         oWEBeCsfBSG6ZHFB9XXJJmFnfmGGvFbY+w3iNBLq8yKwY9eK+YHsb2GtAo7RYyyBx3ID
         9m+4NET+N/Dzsa3Y/L/bziuTmSrqIjgYRdMmZcLgjhm2qgVB33xBEcOAX//UO3RysFFE
         +4O5q/rECJWbN12j02IpaX54C8EyxvUl0Anu1/vetWZ+2rECRr232hy8RVzVBHXpq3uD
         8UMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772547251; x=1773152051;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UsdCJXnxkTNbIWbjZLNJ5b3UIxV8qEBiWBR+b3b28Jk=;
        b=APRFqaU94U6Xv33IqSSdCo/YJzrQR+AxoGZwjra5EhUQg1050NM3bzXfrDn2Z4B4lk
         w8E4jQ/BZEgr+YLygTYJx2dFzKLW9OLx1Y2YtB/U6+wMIWX9ExvJBynlpM6iB5nQJiaG
         GTY2dVj+9HG+WVFJXWWVd3sbRBRd0A9vLkuAM/J1N+KDvvD60++jzEknh14Wvx1Bzlb6
         0AMEF8kbqxS1mkPRM5Z8Nln7XDczuDJvWinbHwf7KU8j9d+oN2OC9yGodsr02FhdzADh
         o9tSxcxD3AfgZCGjWuRsONw8Xm+ocALyOa8KFjKiHM/YXULAydFlnOSEdcvJfO8N5SVu
         tAfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWP5i5RejCv90X7lxVf0PkhIgMTnQJOicZbNIVJ7DB2UIcBgjE7SXvgyhzZvMdDS76q4frzikfRj/E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnYbaK0o6CU1uws3FG+Xf28Fz/sEdr+/lJcRkZunbQID5uydEW
	732qvwova8wvYAgrfgI1/FktwvzxTMnx0Augf9GYWpcDhvbBcpDkB9bfgdGFF8Y/gnqYJc2PVXz
	z4kf19lv4gGZYMDFxsretSKiEovbCNWg=
X-Gm-Gg: ATEYQzzDDWSD2Yy4MZFwC5DEMQDMlVkeAA4zp2kzqqph5yyrPLyOFZhDeo/a0AR0hSf
	FC1YUVSbCR8gdQnbqgAKbiSII/Dk4cX49WpXwLbOfMvHc7gQnT6WJMjASAzkkFp25p9LfXtXdjJ
	UIghsOtov3tNSYQXT/oZ14xydKvkLqLFbWiVEw7w8zAImfkWrdSdg0MNr6y4GV7brXESDd8RKmV
	T/P3SP/aIAD0sb9eS34RzDkoflPm4wI0ijNznGOHJPgXGA5J8GwefJErgN0sR0Q6HZtr+zOHOxR
	2Ek4dYRpIg1G/vbO
X-Received: by 2002:a2e:be89:0:b0:38a:217:5e98 with SMTP id
 38308e7fff4ca-38a02179e23mr103446121fa.38.1772547251117; Tue, 03 Mar 2026
 06:14:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241213233552.451927-1-abhishekpandit@chromium.org>
 <20241213153543.v5.7.Ic61ced3cdfb5d6776435356061f12307da719829@changeid>
 <cd1506b7-0438-4505-946e-4fc90961d3e3@gmail.com> <CAD3SCTF7CG342tLe4ShMJHczrMUvnSRTxowt-EsGD1tt2TKmjw@mail.gmail.com>
In-Reply-To: <CAD3SCTF7CG342tLe4ShMJHczrMUvnSRTxowt-EsGD1tt2TKmjw@mail.gmail.com>
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Tue, 3 Mar 2026 17:13:58 +0300
X-Gm-Features: AaiRm51sYXlYeemsCl43cf-AXd-V666gWKpMA9rTX0bg7lcBRT3oFtT4DMyHm1Y
Message-ID: <CABTCjFDeKjfi_7zx0jkss=BPL-M2oydTbz2Hu7KGFJsZj21Wiw@mail.gmail.com>
Subject: Re: [PATCH v5 7/8] platform/chrome: cros_ec_typec: Thunderbolt support
To: Andrei Kuchynski <akuchynski@google.com>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, heikki.krogerus@linux.intel.com, 
	tzungbi@kernel.org, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev, sboyd@kernel.org, pmalani@chromium.org, 
	badhri@google.com, rdbabiera@google.com, dmitry.baryshkov@linaro.org, 
	jthies@google.com, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org, 
	"akuchynski@chromium.org" <akuchynski@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 1167E1F1527
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33911-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dsankouski@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

=D0=BF=D0=BD, 2 =D0=BC=D0=B0=D1=80. 2026=E2=80=AF=D0=B3. =D0=B2 14:31, Andr=
ei Kuchynski <akuchynski@google.com>:
>
> Hi Dzmitry,
>
> On Mon, Mar 2, 2026 at 10:36=E2=80=AFAM Dzmitry Sankouski <dsankouski@gma=
il.com> wrote:
> >
> >
> >
> > On 12/14/24 2:35 AM, Abhishek Pandit-Subedi wrote:
> > > Add support for entering and exiting Thunderbolt alt-mode using AP
> > > driven alt-mode.
> > >
> > > Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> > > ---
> > >
> > (...)
> >
> > > -     amode =3D typec_port_register_altmode(port->port, &desc);
> > > -     typec_altmode_set_drvdata(amode, port);
> > > -     amode->ops =3D &port_amode_ops;
> >
> > The last usage of port_amode_ops is deleted here. Is this a mistake?
> > AFAIU from kernel docs, port_amode_ops needed for alternate mode driver
> > to send vdm messages to partner. Now, when it's unused, how does
> > alternate modes work in this driver?
> >
>
> The assignment of the typec_altmode_ops struct pointer is still here;
> see the cros_typec_register_thunderbolt / typec_altmode_set_ops
> implementation.
>

It's the .vdm callback implementation(cros_typec_thunderbolt_vdm) confused
me - as per docs, port driver's .vdm should be able to send and
receive vdm commands, but cros_typec_thunderbolt_vdm don't do it, whereas
port_amode_ops.vdm do.

So port .vdm callback just imitates vdm exchange to satisfy the altmode dri=
ver,
while the real work is performed by .enter and .exit callbacks.

Old port_amode_ops can be deleted because unused.

--=20

Best regards,
Dzmitry

