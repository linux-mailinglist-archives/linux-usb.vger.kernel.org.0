Return-Path: <linux-usb+bounces-38105-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eFJlFhwaF2ov4gcAu9opvQ
	(envelope-from <linux-usb+bounces-38105-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2026 18:21:48 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A969C5E7AAB
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2026 18:21:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7C296304201E
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2026 16:21:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24BD9428464;
	Wed, 27 May 2026 16:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MtsCw/0k"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EFD426EDA
	for <linux-usb@vger.kernel.org>; Wed, 27 May 2026 16:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779898877; cv=pass; b=IN42g5tv8hS0JcyDqZweeGXULIVN1w0TUzbJlNW8KF8QQKA1YgPLNwYHe/6isBgurMK/HbzwNZwzvRlIJv1x8vntOjK77HBpqmuGELgNUMJA1aCKTOJP5UHtPfOsQIkQSx2hSWuNIR864ZOrDYk270k/9mnCcpol6t7Ht0QGdTE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779898877; c=relaxed/simple;
	bh=3dxrqcdNnKYVhdfP7nh0R/VHpio1dU95MRkKy/vXfjQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EIkj7rh55lPT4+B0lLWZClJmlaibiw++uCqca0/VjaystU62fOEHXkTNMZPzIJ+TSM40oszEqXxc2lVPoOODIugmx8Dbtgo+ihChwB+/ENANcjKTA/KwKpQ5lZuPPL1uF9IhaNNXd0Kd/YUVIUGO+/vV47nG73A0/a+wS5fCQxE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MtsCw/0k; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aa4b50e054so1082479e87.1
        for <linux-usb@vger.kernel.org>; Wed, 27 May 2026 09:21:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779898874; cv=none;
        d=google.com; s=arc-20240605;
        b=EVI/UFllRFXDOgLrrAiAYfRzeKKGWSElbzivpNC06QxZGyWLH2ezsdi7eMKQM3gv1p
         yIZaWt8vPbPXooUZPjM8o51rjBMTJC7Unr+IeL4FfctwUCUDQVx6/3SElZ9seHZJLHQy
         WWoJskYDt/dgSjFZI5B6xEl0boTMf+f76mqLdjyITBRBsbyjZMaE/WRMaynnqcuXLZ9I
         aYniXGMBdn3qHSpH5PjYtT91tTuDcJhOoIpP/zMun5ChVnEIoPbUa5WMb5WkPBnxhc4D
         B4BvkNf2VmTU6sm/1cIlthhkMWCbGczb2xLllGMA2enk8c4RfQNjwzrxP0f5vvDVkPVo
         JTBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3dxrqcdNnKYVhdfP7nh0R/VHpio1dU95MRkKy/vXfjQ=;
        fh=Z6mZxUhDldpoaVU/QSA9HDE//rBZYq6TCQTPtchOEmA=;
        b=iG5acu+tMSX1vp9eCHlZtpUzKSq/t7QbW4IYG3Jdpc3aayOgkuWXqRcMLBmjJcnKW4
         D84J3LVfS7WpWpegnpTlXfZk2hD4JRGtyYijkegwrnn3tWC+maCjxZq6FYmoT7Rk98ZO
         kExaeMP8CmqQA688njhbkLyUerS5RScTSs92tPEDiwlFAQz5XSShncL8+n5U/6OjnXrX
         R0zuWKSkjtARvdNoE56fU+74xAeXiWF3IGZqo/IN4iOWMWYckeCG2ACUI92okVaRU4zR
         EW586JegzAT8qYyoajEhqmhZ1tf7vAGc+FFyAEpWz/gfgr7MNw6D04DZdu8te13lCMMP
         0Sdg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1779898874; x=1780503674; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3dxrqcdNnKYVhdfP7nh0R/VHpio1dU95MRkKy/vXfjQ=;
        b=MtsCw/0k4OTSh4B9Pxdh8daiLEm1A4poAtaF365+vNmdjmNuioPQE6g8HcgmwrknBF
         f1Q3Jm83/Zr6u9mhgKmWMxNGSPRXmiv1g6vEKggOtJJgd2yttYR/1v+gVAIoNokSeBof
         G5Lj2vyr9uNlDENkRHcJphLP7MfjDoFs3NgvU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779898874; x=1780503674;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3dxrqcdNnKYVhdfP7nh0R/VHpio1dU95MRkKy/vXfjQ=;
        b=kPvMTkAhSt2IO/pLxm18zGlSjv268EKUDkgTCKVLSTcjGT+wF3VDEpB2VGhfiei/jf
         EZ519g7A44ZLUmLyQoGCX6PxjvVuMsY8PGV7X2H0d9iWYZuFl4dVBONOkatxyuYCXupi
         r0Uc5t970vCsoY0SSQ3b9IGiIH6kR/1X9OKc02KG/CCi2AgK7D0rI3PpBvlc7UBEwN0b
         HIxRb0vUrkMrKvu6+szgXfv+2Yjn+MDEu3JCgBTzonajA/1ceePMmGaFfdqce8UMKwrs
         gL5X/x6f6JUZsr1omxz9J7WLcS+TFAKHSU8MebKhJOvhhgPC2/ZGg5vLvUJCGXy4ykYM
         LdbA==
X-Forwarded-Encrypted: i=1; AFNElJ9PDhiWrNeowpyN00qt0ii5RBNbHMHdZLkn5atisRHQ7qrYOvmXVtVgrg8EfugTVXycKMUtE9/Qqbc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp7aCsB24Op7GZDz4QChSIBg/Ex5G2bu0VcI9PNx8KDnXIrmsP
	TJBHTXZDWLAKWxiZJytYzcpFSauUearXlBPNW3SVaiAmaflaY+SNuG5R+oVbGhaz+oEPwOxxKQy
	9F7oOvMPTkUrrN0dRjHm+9FwGJxxRy7KKY77W1EbP
X-Gm-Gg: Acq92OFFTFjREk1VGUMDexpzdYwirqs1MUpaQjjpqJD5BtmlPcKZAJfZOc2wPKj+Sts
	wQf65ql4WtR9BmXv0fW7Y91eCyegiHL1ZD0Hi/inV5GyYszAcYpFoBQuOjpTwKOGL6hcezMe4hw
	mLjhffrDox5zHRLG1IjnWmFeoW2WvRBjyNlcpgdDv6r0Tsjj6SwIyIdLadF5ee9YB5E3U/YX0FO
	0LxjocZTXLAvH+5nUdG7xU13e1/iQ6T2nSQvzSWTXL81zgcBMVhjB6XhagStBav+FqQLpOpiVHk
	p6F/SkdjkxMjF9q0xw==
X-Received: by 2002:a05:6512:2204:b0:5aa:b6a:9257 with SMTP id
 2adb3069b0e04-5aa32393ff6mr7614476e87.44.1779898874134; Wed, 27 May 2026
 09:21:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260515090149.3169406-1-wenst@chromium.org> <CAMRc=MdnjRRMVzxPkkrPhQ4dz7rsK8-HKUp9cQ0z11apL3escQ@mail.gmail.com>
 <CAGXv+5HC3dqgcE3KnKzakHHWFHB6m_X42orOkNUvZvp=SL_O8g@mail.gmail.com> <CAMRc=Med-_0GSYzoFBRiwFzBCK0DZqJD8_SEBxi+zwR20GS-HA@mail.gmail.com>
In-Reply-To: <CAMRc=Med-_0GSYzoFBRiwFzBCK0DZqJD8_SEBxi+zwR20GS-HA@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 27 May 2026 18:21:00 +0200
X-Gm-Features: AVHnY4LzsI5n_9iqirzC_of7SGIfiJw_kQ6vIsCvh5Qe5puVB03Deb7QvAn9uiw
Message-ID: <CAGXv+5GbW0bx3nKdZt2+tHuHyQ-J-1-Z79nMzHAwjmEPGKT02A@mail.gmail.com>
Subject: Re: [PATCH RFC 00/12] arm64: mediatek: Add M.2 E-key slot on Chromebooks
To: Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38105-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,collabora.com,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenst@chromium.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,x:email,0.0.0.3:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,chromium.org:email,chromium.org:dkim]
X-Rspamd-Queue-Id: A969C5E7AAB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 26, 2026 at 11:48=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.o=
rg> wrote:
>
> On Sun, May 24, 2026 at 10:06=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org=
> wrote:
> >
> > > >
> > > > I expect some discussion on this patch, because a) it adds some
> > > > OF-specific code into an otherwise generic (core) driver, and
> > > > b) it doesn't yet handle USB 2.0 / 3.x shared ports; it ends up pow=
ering
> > > > on the port twice, which negates the port reset part.
> > > >
> > >
> > > I understand that you do this because the port device has no OF node
> > > assigned. If we wanted to call pwrseq_get() for the port device, is
> > > there really no other way to associate it with the correct pwrseq
> > > provider?
> >
> > I suppose we could tie the "port@X" node to the usb port device, but
> > AFAIK no other subsystem does this so we would be introducing a new
> > pattern.
> >
> > In the M.2 pwrseq driver, we would have to match by port node instead
> > of its parent device node. We may end up with different behavior for
> > the USB target vs the other targets.
> >
>
> I imagine, we can check the bus type of the parent device to know if
> this is USB?

The "bus type" type is probably not exported. However since the DT binding
explicitly says which port on the M.2 slot is for which connection type,
I think the matching can do a special case check for the USB port.
The next obstacle is that the target string is not given to the provider
match function.

> > Also, the "port@X" nodes only exist for the OF graph connections to
> > connectors and/or muxes (this series doesn't deal with the latter).
> > For directly connected devices, there is a "device@X" child node
> > directly under the USB hub node. That node is what gets tied to the
> > the USB device.
> >
>
> Is this a problem? I don't think I understand what you're saying here.

It shouldn't be. I'm just saying there would be different behavior on
the USB side for connectors vs onboard devices (like hubs) device nodes.

I talked to Greg earlier, and he said not to touch the hub driver; the
hub driver should only deal with features from the USB spec. The
"onboard USB devices" driver is what should be used. And this would
be a proper case of adding an auxiliary device to the M.2 slot driver.

However this seems to completely decouple the power sequencing from the
USB core. Take the USB A connector for example, it was recently added to
the onboard USB devices driver. However the connector has a device node
that is not a child node of any USB host controller or hub; it is connected
through OF graph. At the same time, since it typically sits at the top
level of the device tree, a platform device is directly created and the
driver subsequently binds to that device. This is totally different from
how the hub and other directly connected onboard USB devices work. In
the onboard device case, the device node is a child node of the USB hub
or controller, and the corresponding platform device only gets created
when the USB hub driver probes, thereby sort of tying it into the USB
device topology.

If the power sequencing ends up not connected to the USB subsystem, then
maybe the M.2 slot driver could just check if the USB port (port@3) was
used, and just enable the USB / BT pwrseq target at probe time? That
would mean less changes needed.


Thanks
ChenYu

