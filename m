Return-Path: <linux-usb+bounces-38127-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNJEH2kAGGrgYggAu9opvQ
	(envelope-from <linux-usb+bounces-38127-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2026 10:44:25 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8AC5EEDA0
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2026 10:44:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5F7FD31C5A6C
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2026 08:36:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FC1137C0F7;
	Thu, 28 May 2026 08:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VFNaXUBJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D8737BE83
	for <linux-usb@vger.kernel.org>; Thu, 28 May 2026 08:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779957371; cv=none; b=pMf0QJDpMXctA8LI6zZqiWTZ34RPaVqM0wLjfojDsdNXuxxINOao5UPsyRvni6VTkjGGi0tcsMVak6a5JXomd4Bejwu0i/trqU1Cqu7ATlJ1tBIAZiRcbJPqKBb/Rzl/RrNkROdyko0MsUkmnQcG92bghZtUF7PKOGUNQQGmM3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779957371; c=relaxed/simple;
	bh=9UNntRspjFE8WX/VC4OD1Dp4xpuokktTA18B+ogWTro=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B2OJoU37RERh/GNDkT9qXRHRKuKKviP5Dsdjg4NNQwiZ0ox8yQCvjmhl4WJatBGco2ncEf8pzAz0BdPPTQxFMpcJGFePjUrz7FnwKWHmz5FRdbKVScordD2VyTRSYQDUFAtZU91oVNx9titSzo0wVr2QOr2yB6fzX7R05KkkOe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VFNaXUBJ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2A751F00ACA
	for <linux-usb@vger.kernel.org>; Thu, 28 May 2026 08:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779957370;
	bh=Jhtv5gfHMhMDDRGWAxzr1d+I0IvsgpMKf5TSuP9K5us=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=VFNaXUBJ0I6dWCgSi4X6uquLZRc6uD2cheJlY0GPnVygZId6+xB41Jc+WheBTpwfT
	 ByQ1uFkmt4r8QayZ8u+4l84wV5bp6DbqYpOpMHH3h4jjOfIvCOK3brITCXf+AxvEPw
	 CwGUI5gCmYoo5ZP5M0bHShcZgFHl7vf49cJFu2gvgR9ue+tN6HYCyuFxuB3trWkwT+
	 5634ej4meY9PsxqpyYp+mR1bqoPFCjKOm84BcbbdIpiqJ2gTzpNU69XoJst80a0gJa
	 xILfdwI/KQcs2o5Cn2rcRGxaxLwvPsb54G8RGaFrXSpquyDgjc839sns123iuSaO/x
	 WcgiGwK6ozdmg==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a8738c178dso11066886e87.1
        for <linux-usb@vger.kernel.org>; Thu, 28 May 2026 01:36:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/ISvyO2HAWIaWCs1XU9uyijkuUu0MYG7VA4N/mVP71th8bOeYqXFXx8CsrhFHmB6nDJFN3XU0ekvU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxluS1cMsWXTGXSQZbkDZVhSWWQpDhhHHC0J7blyU+eSJg+a7+8
	XFFNwQxQpFlFez4V7RMWd7juoVmO4jTmkIlcYaeEXuLXKZYTUt/D/NKNJkFZiPHs76TgjUznx+H
	e2kPjPrOlZMI3wkwClElWFNtZ4EELMTWTyJwA0vxzdQ==
X-Received: by 2002:a05:6512:682:b0:5a4:301:b92 with SMTP id
 2adb3069b0e04-5aa323daee7mr6994841e87.33.1779957368708; Thu, 28 May 2026
 01:36:08 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 28 May 2026 04:36:07 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 28 May 2026 04:36:07 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <2026052710-flagship-unsmooth-ce82@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260515090149.3169406-1-wenst@chromium.org> <CAMRc=MdnjRRMVzxPkkrPhQ4dz7rsK8-HKUp9cQ0z11apL3escQ@mail.gmail.com>
 <CAGXv+5HC3dqgcE3KnKzakHHWFHB6m_X42orOkNUvZvp=SL_O8g@mail.gmail.com>
 <CAMRc=Med-_0GSYzoFBRiwFzBCK0DZqJD8_SEBxi+zwR20GS-HA@mail.gmail.com>
 <CAGXv+5GbW0bx3nKdZt2+tHuHyQ-J-1-Z79nMzHAwjmEPGKT02A@mail.gmail.com> <2026052710-flagship-unsmooth-ce82@gregkh>
Date: Thu, 28 May 2026 04:36:07 -0400
X-Gmail-Original-Message-ID: <CAMRc=Me=ujnscSOKhHDLz+ccMDyLyCfZnpqobF2BJ4YowgXB5A@mail.gmail.com>
X-Gm-Features: AVHnY4LBp1nsLqjfLxLqbZp_YoBQEjH0FEHfrkmt_Ac8CfZjzB49fTtbI51YibQ
Message-ID: <CAMRc=Me=ujnscSOKhHDLz+ccMDyLyCfZnpqobF2BJ4YowgXB5A@mail.gmail.com>
Subject: Re: [PATCH RFC 00/12] arm64: mediatek: Add M.2 E-key slot on Chromebooks
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Chen-Yu Tsai <wenst@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38127-lists,linux-usb=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,collabora.com,vger.kernel.org,lists.infradead.org,chromium.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EB8AC5EEDA0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 27 May 2026 19:41:30 +0200, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> said:
> On Wed, May 27, 2026 at 06:21:00PM +0200, Chen-Yu Tsai wrote:

...

>>
>> However this seems to completely decouple the power sequencing from the
>> USB core. Take the USB A connector for example, it was recently added to
>> the onboard USB devices driver. However the connector has a device node
>> that is not a child node of any USB host controller or hub; it is connected
>> through OF graph. At the same time, since it typically sits at the top
>> level of the device tree, a platform device is directly created and the
>> driver subsequently binds to that device. This is totally different from
>> how the hub and other directly connected onboard USB devices work. In
>> the onboard device case, the device node is a child node of the USB hub
>> or controller, and the corresponding platform device only gets created
>> when the USB hub driver probes, thereby sort of tying it into the USB
>> device topology.
>
> Hm, did we mess this up?  If so, we can always change it if you think
> this should be done differently.
>
> Hubs should be dealing with the power issues for their ports, so maybe
> rethinking this might be wise.  I'm just loath to add hardware-specific
> hacks to the hub common code for obvious reasons.  Anything we can do to
> pull it out to a separate driver is best so it doesn't affect the 99% of
> the users that don't have that crazy hardware :)
>

IIUC what we discussed with Chen-Yu yesterday, the only thing that needs to be
done in the USB hub driver is attaching the port firmware nodes (if present) to
the port devices we instantiate. The rest can be handled elsewhere.

Chen-Yu: correct me if I'm wrong.

Bartosz

