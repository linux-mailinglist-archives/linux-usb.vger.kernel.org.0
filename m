Return-Path: <linux-usb+bounces-34652-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGxdNc9msmk3MQAAu9opvQ
	(envelope-from <linux-usb+bounces-34652-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 08:10:07 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA5526E291
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 08:10:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7BBF73047538
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 07:10:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22D0B3AC0E1;
	Thu, 12 Mar 2026 07:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="YG+J32kQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E90381B13
	for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 07:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773299401; cv=pass; b=BqvfslppuAwVDWYjNLA+/i/oseREYHuzKCxGMLKZBZYDzxniZK+2QOPhhR/zBTzH1MGiIy05DtWvSjaodM4d87BkAeM+CunQK5c/niwuolv/L6QxHBfU0IoboWcK0pS4DdhH+1P0D6cCoPb0jkf769STcYo8la/lpBfy2Dy5fo0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773299401; c=relaxed/simple;
	bh=//7rLSOz4jMO+zUV0Bv/vdwo9WVbaATXrhHdz7hzAzk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MlPCQTG0kmCtAGnsCiMpvqN4pZwCgjv74dZOgpjCpEnzI0auQ6PDTE+NKF5PsWZjWiJQJCs9ijSRRi9hyYlPy4ROTeexFZzz49G+qJHsx2nfoM5+0k9TJXJCRZGDcwoWephGy3P4DrgeEo3OlSX21/JGSgWcF45kd6Fa1Fcjn5Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=YG+J32kQ; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b941d924534so71389966b.3
        for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 00:09:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773299398; cv=none;
        d=google.com; s=arc-20240605;
        b=Evk/uFH4hedvgl0Zj/SoMIOjJ0VmgHIg1ViJjHbxqHFrq7wUvWqfk6QP3HbEe9jAl/
         fW63yAB0qcMWmMV1JuuF+kW22M0hXPW9atXMFc5fmKtDz0C1yNtvUmlS/8pCM8tiIMDy
         m+jTZIcPqVPzRvOLtWGDK/cKGzM71jjpHoNvmMc2Pr5Yh1RLa85iA8BkJ29/ceS6wJ2A
         bJCFrVYN1jIgkqZdgsGty8J2ybGCj0JoXn1qtPGGLhNcq+o7wBt8jpm72sncejEXh4dh
         q/25Qjt/EQv3yMMp4ayK/6ueao1Xx/buQ8oEBtumBShsJlaJpkOD2OvlGX9V9Ib4Crx6
         jEYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rIO8XUP7143gVJLUd0FUXnb9BilWdnCaidVriG8lVsM=;
        fh=m3q4UFTxMP4Ja3dnf5pR4PwqFWfmkMlLrZVsXAjG9Zw=;
        b=Me35R76hEwfPA5RffVvTw3gP7oGFQhg128Mpi2Vosxc4NacYwOiAngNNdN5SYg+VcK
         o2jOanFL+ZID1BiJciL1NfODYCd7JjCGKm4OfwLIVKdCIgLMlj3FCbPMX6gsysyG6KQG
         NB+3y2P7yVGqWc9rISLEAzcmvZi7c7hNBWUNjc6X9hZW5uq2FRrx4LG0xAv4xh11vhAO
         /XQYsO+n4TSE6W9RkDsp+nMLkqfdEyUsOH11PFK0p8SJs5I7crnYL7k2CGXXa7Yq2PiP
         VgexHL8o2hQEbAPWKLsIhj6FhwM5DFPnUMLL5+PtCDHvQ7mr6EeIfYz9WuX3olRra/HE
         QfcQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1773299398; x=1773904198; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rIO8XUP7143gVJLUd0FUXnb9BilWdnCaidVriG8lVsM=;
        b=YG+J32kQ71zNvFjxjpXIBgYJIUA4nOP4qkq7jY2FPS96usAnt+cZpkOWa7IPl9xmbI
         ahw1gmpsqSZ8anWuAhhdMSp0xfB5htf4B5upXa36cMnxZJUv3JShkPm4mNSAfWQHD8Z4
         /4AyD7gMNDWNBL+A59pzJ6cyRzjvWH5MaBNbS0MRHOvjmx7zCvqMojp201ECkLsEMLLq
         d7Ye7G567CP4fqRq07q2MQM0NA6nDnpXaxNES1bAqaMMhflgJP6QzhB6WanupTVL5S42
         XBOzoweDFj0C4J17aGOYuxE+7mhh25SHLOS2IXjfpLzebniCFKGDkai7440vce196CFH
         1QSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773299398; x=1773904198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rIO8XUP7143gVJLUd0FUXnb9BilWdnCaidVriG8lVsM=;
        b=n/UvnTAsIgKIFany0FPW2NtQmb1kpIqfkJyIljlTq5MVZjtRgfbrffEeOcbSyVKf/P
         IrEI5s/BG94cUeeMFNFaR3ND8eY9CsmosXmlG9LCzMkSrlukpO9JBZmCIW+R2H7TA33n
         YCce8dpQvYnxoSeuk9YxrJX6WKMdghtLolsJ58GMROwP8y7IQCFT/ibHfNKBOoPeoqwj
         urIFezbQcRtN0v06FbRmvjil4gtSTveDHLlxOdwnmOtH0aPIZdEW4E1ZAXdvi0o59UYx
         Byo3pq/WOXmBmzLl0uCFMZIBCHLD/8REuhYHGNmsV6BoceCpWChIEdi2F26ngVM6ke2v
         U0Vg==
X-Forwarded-Encrypted: i=1; AJvYcCVBeaSWrqKWSYl53HkEIrx4xv/4Oguc5DhLe+oMlb8bI0Q2Yab9WBCjcmJ+RNQbN85V3s4qstwQEW0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx/3skRfVo7FbPBNgmoKDRiSWW4DEs+qc4VgN+4r5q4dKkALAu
	19ENqsZ8I6q14loLDJQu1rR2h3NzMzEuUqAVe1ZYp2vWZDxh3jrTDrrc0kvbcREOolhzo0m3zgp
	Qzp8npwvTWdIpgGuauo+qakVaK9zlGinZuPmyiJB9mw==
X-Gm-Gg: ATEYQzw1oh4rLXuMrVl4z7rJ8O5XA+4DR2oCbP3j4iJ7nWjZ+zb+IcHq7J/H7MqHfBd
	CehI9CoTLtT5Jrnh6mL+VVj9xWIzbi2jBy2orEze3DzLmTG0kY5vpy6DzYo604GMSlcbiaax9CD
	UAEQQ4m24ckDyf89HcyMena7cUW36JrfqZhkwrff/TCz0hmnt6j9HIC79k38mHk1zDnnScQFWL/
	C9v+cFBaHBWkRn0M66M/2X6DWy5lH7n4aKiuiQ9gvkoUctbyKq6vv/8lvt9fcTX7I3AdLLByaYW
	VWBf7rw=
X-Received: by 2002:a17:907:d20:b0:b96:dd1c:9408 with SMTP id
 a640c23a62f3a-b972e5a7e72mr299557966b.54.1773299397660; Thu, 12 Mar 2026
 00:09:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311-husb311-v1-0-f25bcb58cff7@flipper.net>
 <20260311-husb311-v1-3-f25bcb58cff7@flipper.net> <20260311-married-democrat-f6eb1c651e97@spud>
In-Reply-To: <20260311-married-democrat-f6eb1c651e97@spud>
From: Alexey Charkov <alchark@flipper.net>
Date: Thu, 12 Mar 2026 11:09:43 +0400
X-Gm-Features: AaiRm53JoSVHPKKchRGU0H0o0pu24aIAgKHDs-WeWrrs5xSsEXLakFZd28fKT1k
Message-ID: <CAKTNdwFQnySkhpLDrFh5kwX=_tvci=g0Y6Q5y-15Qsogd=FxOw@mail.gmail.com>
Subject: Re: [PATCH 3/4] usb: typec: tcpci_rt1711h: Add support for Hynetek HUSB311
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Gene Chen <gene_chen@richtek.com>, 
	Heiko Stuebner <heiko@sntech.de>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[flipper.net,quarantine];
	R_DKIM_ALLOW(-0.20)[flipper.net:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34652-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alchark@flipper.net,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[flipper.net:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hynetek.com:url,flipper.net:dkim,flipper.net:email,mail.gmail.com:mid,xkwy2018.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3BA5526E291
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 10:33=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Wed, Mar 11, 2026 at 08:20:46PM +0400, Alexey Charkov wrote:
> > HUSB311 is a pin-compatible and register-compatible drop-in replacement
> > for RT1711H, so add its IDs to the existing driver.
> >
> > Link: https://www.hynetek.com/uploadfiles/site/219/news/0863c0c7-f535-4=
f09-bacd-0440d2c21088.pdf
> > Link: https://dl.xkwy2018.com/downloads/RK3588S/03_Product%20Line%20Bra=
nch_Tablet/02_Key%20Device%20Specifications/HUSB311%20introduction%20202105=
26.pdf
> > Signed-off-by: Alexey Charkov <alchark@flipper.net>
> > ---
> >  drivers/usb/typec/tcpm/tcpci_rt1711h.c | 21 +++++++++++++++++++--
> >  1 file changed, 19 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/usb/typec/tcpm/tcpci_rt1711h.c b/drivers/usb/typec=
/tcpm/tcpci_rt1711h.c
> > index 88c50b984e8a..ac5917c1e253 100644
> > --- a/drivers/usb/typec/tcpm/tcpci_rt1711h.c
> > +++ b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
> > @@ -18,6 +18,9 @@
> >  #include <linux/regmap.h>
> >  #include <linux/regulator/consumer.h>
> >
> > +#define HUSB311_VID          0x2E99
> > +#define HUSB311_PID          0x0311
> > +#define HUSB311_DID          0x0000
> >  #define RT1711H_VID          0x29CF
> >  #define RT1711H_PID          0x1711
> >  #define RT1711H_DID          0x2171
> > @@ -55,6 +58,8 @@
> >
> >  struct rt1711h_chip_info {
> >       u32 rxdz_sel;
> > +     u16 vid;
> > +     u16 pid;
> >       u16 did;
> >       bool enable_pd30_extended_message;
> >  };
> > @@ -308,14 +313,14 @@ static int rt1711h_check_revision(struct i2c_clie=
nt *i2c, struct rt1711h_chip *c
> >       ret =3D i2c_smbus_read_word_data(i2c, TCPC_VENDOR_ID);
> >       if (ret < 0)
> >               return ret;
> > -     if (ret !=3D RT1711H_VID) {
> > +     if (ret !=3D chip->info->vid) {
> >               dev_err(&i2c->dev, "vid is not correct, 0x%04x\n", ret);
>
> Why are we checking vids and pids here? Rejecting a non-match prevents
> using fallback compatibles, so I'd like to know why the code exists.
>
> Is it just here for the sake of it, or to prevent some actual issues?
> Not really familiar with USB devices unfortunately.

Hi Conor,

It looks like a relic of some original vendor provided driver code.
Rockchip's implementation of a HUSB311 driver [1] contains similar
checks but I don't think it adds practical value in the world of
Device Tree (after all, it's just an I2C device - I haven't seen many
I2C drivers reject a DT match based on hardware IDs found in
registers). I chose to avoid removing them with my patch though,
because I don't have any Richtek hardware to test such a change.

Maybe the error could be downgraded to a warning though.

Best regards,
Alexey

https://github.com/rockchip-linux/kernel/blob/develop-6.6/drivers/usb/typec=
/tcpm/tcpci_husb311.c#L217-L244

