Return-Path: <linux-usb+bounces-33305-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKFYGh9UjWlz1AAAu9opvQ
	(envelope-from <linux-usb+bounces-33305-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 05:16:31 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EE412A49C
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 05:16:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E3F763025F09
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 04:16:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 922BE13777E;
	Thu, 12 Feb 2026 04:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="AHLFK8dN"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597713EBF21
	for <linux-usb@vger.kernel.org>; Thu, 12 Feb 2026 04:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.125.188.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770869782; cv=pass; b=s8d7dHvZGAhVQ+36FZT7ZD3DUuNaf/uFD5QOzM7iUicsuxI4mBW3r7GPmAmNHHe4ERtcKkrSWdW21zYyFityS5m0MbqojGzD7wnSK5TbQNu0qLGfY6g5WU9KEpIKVtkjHgnhDeH2kvRfCyxFLOgSL7s7rHIroUxBLqL53/QTbqE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770869782; c=relaxed/simple;
	bh=w7K1QAE96j7f5rStsHwEZGygtgLPdLj92J3FLdVu2KM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HwNoYhUQhEcvv6Z/p9UogJAjvSadY9D1JDKQh65ha4k2EbEHzWo34jkHWyqxe1Ir7JJxrRaEgkN4yivRh9x5sAO8eGPNmxDg+yIIapq+GGTUpwoBoD4oQJbkoEroC9znXSJTIp+cSArNn3tgvbdTOk3e9J6da7RpO4XKWi0LJ0Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=AHLFK8dN; arc=pass smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 6C9313F2CB
	for <linux-usb@vger.kernel.org>; Thu, 12 Feb 2026 04:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1770869777;
	bh=j4I7UygGS+PaXeahOVnHzHn/bcwDGMsTQMfuAgrTY+I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=AHLFK8dNQKTXwALD2RrNxXpbtyAOkFY+BEcOUPTRZzyuvByM8btQR7jXCfhrLmj3U
	 WZjrh3uFojyqd4mCl7/BOwrxS3Vn772aOQhn8VghxifY6F5uMwm/dsi2eTmslfIb04
	 ouxW8v2bbAwJ3DMSCV0dTrq0NdVO3Da8ogh1wtT2269CVl4V75C3US1QfDge9opvM0
	 w/hNahtvmYo2qEJOZpVeA7YORiMkw+zqZEynbdHkpiy1On1N/EKap+hdu5WrrLwcEq
	 MJbdl+/TtDa5Bzgftmsf0nHcA/wnOlheBLMq/cicy9sCCiWw4vxMR+MiLRyC7pCqkt
	 Oe62TLpiTkvLyZwpJABVZOVika/oI35K8r/N0+IMIF1Gonn4PujVJswzeBMaH385mj
	 XYhPT1v/ckz7S/0MzBBYzVQ8LHvbN9ubRfS5Q3hFJwC7/RAfUu86GD2AO/XVvGnKFi
	 huUDBML9T9EdguTSa2eBFacZ+6XihD7U32LLdSgA5OFLU6fF4K5OtEuMEVnyRiV+bA
	 4/GdcNvbi5BQj8hcczpRv2PhoGovNyMJMM6sWZfvEG97MGpCsWLF4WNsAB/L7H88v7
	 N67hq33R3/1QcboUzyS7wXix0RDTxnmAyws2jA+ksDREWXKTyLneQKNO7gYJOQddHA
	 v8WU/3RNDxag6/AbhPx6Nsko=
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-b8f91f9c9cfso26173266b.2
        for <linux-usb@vger.kernel.org>; Wed, 11 Feb 2026 20:16:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770869777; cv=none;
        d=google.com; s=arc-20240605;
        b=N7XCjZJIUgrLqGqspJMKd6aqjqJrrVIuaFhxavo6+r1PzLTMchR4zXAqovysiWLhwF
         h6vczfhG5Gibs1THy3qqiQFzrNMNWkWmxPmeexiXKagxBo19pd4xFQx6JWiOk6lo6tY7
         cNuG55UkMa0XIJEhpYsE02EPvKQb7nVbA7pyY+3mytwVag3HKKx42364cl/5cyLKJ93I
         avs5yyIrTmngb9oFkM/GXlkC7kA5mcpAFzLpaRuenhbU4GMBw9KRLtVo3LIJne4H8d75
         qB9BiGNhdI+ZvvS6Fnb7ZQ1gI/F6RV+QolvvCuSCYYLlMgsAKl5zn3cS+bTp9NFRMXJr
         9LVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=j4I7UygGS+PaXeahOVnHzHn/bcwDGMsTQMfuAgrTY+I=;
        fh=5rkPp6x9WQqoOAbRiv2OTFOPlwuYwwcW78ntHdf4CG0=;
        b=WuejKPEo+8Fru+4NwJumu8fKmn6rx+Myn0f1LuotGDgfGRlMziyzvuPdmo4RJhdtQC
         Vm7O5BCOPXEH6yE0UTRkYDn4Eeb/WUFpC0KB9/gZ9EXLeCV7bDR2Z6BTuqZ18DNMBYLX
         owzR7Z7eSq6UiMZJl4EN/LJ90nw6HWEWwA+TspZaoy4C1VPLYsVYyXGpxtbn1nKVjv2r
         nSN2lnR+jhgXFLVUl+o4SRmKnIhWLLcovLXVox8YH29REosyYGkVVG77SyR/IBhz259h
         aMjVW47+TKxjLnE0lQvTk2022SmNoXumyZxj4wR8rHo77t1lMgrvL8XFpb6XW6T9Kd+e
         tKow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770869777; x=1771474577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j4I7UygGS+PaXeahOVnHzHn/bcwDGMsTQMfuAgrTY+I=;
        b=uxZt1dKk43iGSJL1EG4N/W7HmWwetVjnsknOHcE5AOmf9lPK06aq7n6Oy/+sQ+2tNb
         LZZt6KiQLvkNMH9tdLs5/t/VbBxS6jXACJGiUwjb3Ht3YKi46y8FrHtWOb5JbvmoFuT4
         H9PJW/mAqGdIu54Gm3gwaqYy0njI+MctqiK4yijzk1MijO8QG8GTEkMSr82l0R6LLFbp
         98KLXYQNXNTFCnxwnte6EL/JDT8aV8FX4ghzAZhK5GH2NAbPr0k6LXyG9Sg7+6qpSKAI
         vWLK+2n3zkh/weChRjSnrzjB83/LjX8ACZNEC5EhwXa0/yPhWeVMC3p7uIwVQXLuGaLW
         hBww==
X-Forwarded-Encrypted: i=1; AJvYcCX8aCMk9/UK9wTAKSOQIQ+BqzSWSrdV8kCWV43pcj05dPFc95+KqVELl+KN+t/Xzp0khkjtIAfmfp8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyneO/r98rVq4Qiy4cOhdHTPe+AmAX9vxr0F7JcFFx+9Wmu/ShD
	W4a1kaRQ0a4UndEKH2bPXd4DeDx+x6b7h/rb+CEMWvkZ1d0KXej/ntn20JSdLmrLiw4DbRqTM2J
	LZR0pgT4807imZn3UWaCbOhpHnSw6StsptOkeNUY/pOM8mR0RqLbQjBWV+FtXqWNl/D3SC539lW
	IIeOO1aCf0WBOqeh6uodoFGV9r4fsf7unPEwjsoX7JL1NJysSp4gbs
X-Gm-Gg: AZuq6aL3NTr5pbaTXy1Xj7lVbsCBxxdBD5KDUqjkIokyeH7G0R4ar/vYeSPF2aaKTUw
	WxtWHfllB7Vcy7dVAk84ctKq/+6Iw2VRUy4RvAf698/1mTeqAkbWsIW6dqRmWmPtfhNXbQWMAlh
	B27Mg6Pfr8YgMBxN4lYH8Vv/0dzg/WidP/GmXg4yWqFQ5BNp0O7jW0o2Y3gzIobWoTDZfjS97ab
	aScqy0=
X-Received: by 2002:a17:907:a4d:b0:b88:38e9:8f89 with SMTP id a640c23a62f3a-b8f8e95de2dmr69525366b.0.1770869776834;
        Wed, 11 Feb 2026 20:16:16 -0800 (PST)
X-Received: by 2002:a17:907:a4d:b0:b88:38e9:8f89 with SMTP id
 a640c23a62f3a-b8f8e95de2dmr69524266b.0.1770869776390; Wed, 11 Feb 2026
 20:16:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aXLM5vk0gDNjLPyY@acelan-Precision-5480> <20260123120112.GQ2275908@black.igk.intel.com>
 <aXbTfLUJ-lEfNzgX@acelan-Precision-5480> <20260126054231.GR2275908@black.igk.intel.com>
 <aXcWNw9Qfo5L9WVi@acelan-Precision-5480> <20260126115654.GS2275908@black.igk.intel.com>
 <aXg1eBudRAaCZpmR@acelan-Precision-5480> <20260127084513.GC2275908@black.igk.intel.com>
 <20260127101701.GI2275908@black.igk.intel.com> <aXrZK-WigVeqxBTT@acelan-Precision-5480>
 <20260129065003.GS2275908@black.igk.intel.com>
In-Reply-To: <20260129065003.GS2275908@black.igk.intel.com>
From: AceLan Kao <acelan.kao@canonical.com>
Date: Thu, 12 Feb 2026 12:16:03 +0800
X-Gm-Features: AZwV_QiRBk5WsEL-7ixKesH5CxR9g3WS88rjQZrmknvpYrb7Eqqz-CyCEPt5ivM
Message-ID: <CAFv23QkN1ypnMq0VwmUbfrxcyqihM1G8Ga3sgiTOWT5rtRnSmA@mail.gmail.com>
Subject: Re: [PATCH] thunderbolt: Fix PCIe device enumeration with delayed rescan
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andreas Noever <andreas.noever@gmail.com>, Mika Westerberg <westeri@kernel.org>, 
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Gil Fine <gil.fine@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[canonical.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	R_DKIM_ALLOW(-0.20)[canonical.com:s=20251003];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,linux.intel.com];
	TAGGED_FROM(0.00)[bounces-33305-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[canonical.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[acelan.kao@canonical.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,canonical.com:url,canonical.com:dkim]
X-Rspamd-Queue-Id: 91EE412A49C
X-Rspamd-Action: no action

Mika Westerberg <mika.westerberg@linux.intel.com> =E6=96=BC 2026=E5=B9=B41=
=E6=9C=8829=E6=97=A5=E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=882:50=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> On Thu, Jan 29, 2026 at 01:45:51PM +0800, Chia-Lin Kao (AceLan) wrote:
> > On Tue, Jan 27, 2026 at 11:17:01AM +0100, Mika Westerberg wrote:
> > > On Tue, Jan 27, 2026 at 09:45:13AM +0100, Mika Westerberg wrote:
> > > > On Tue, Jan 27, 2026 at 01:04:20PM +0800, Chia-Lin Kao (AceLan) wro=
te:
> > > > > On Mon, Jan 26, 2026 at 12:56:54PM +0100, Mika Westerberg wrote:
> > > > > > On Mon, Jan 26, 2026 at 03:48:48PM +0800, Chia-Lin Kao (AceLan)=
 wrote:
> > > > > > > On Mon, Jan 26, 2026 at 06:42:31AM +0100, Mika Westerberg wro=
te:
> > > > > > > > On Mon, Jan 26, 2026 at 11:30:47AM +0800, Chia-Lin Kao (Ace=
Lan) wrote:
> > > > > > > > > Hi,
> > > > > > > > > On Fri, Jan 23, 2026 at 01:01:12PM +0100, Mika Westerberg=
 wrote:
> > > > > > > > > > Hi,
> > > > > > > > > >
> > > > > > > > > > On Fri, Jan 23, 2026 at 10:04:11AM +0800, Chia-Lin Kao =
(AceLan) wrote:
> > > > > > > > > > > > Can you comment out call to tb_switch_xhci_connect(=
) and see if that
> > > > > > > > > > > > changes anything?
> > > > > > > > > > >
> > > > > > > > > > > Here is what I modified, and the problem becomes a li=
ttle bit complicated.
> > > > > > > > > >
> > > > > > > > > > Okay I see it did not change anything (well this is kin=
d of what I
> > > > > > > > > > expected). Thanks for trying.
> > > > > > > > > >
> > > > > > > > > > I see in your log that the PCIe tunnel is established j=
ust fine. It's just
> > > > > > > > > > that there is no PCIe hotplug happening or it is happen=
ing but the PCIe
> > > > > > > > > > Downstream Port is not waking up.
> > > > > > > > > >
> > > > > > > > > > I figured you have following USB4/TB topology, right?
> > > > > > > > > >
> > > > > > > > > >   AMD Host <-> GR Hub <-> TB3 Hub
> > > > > > > > > >                   ^
> > > > > > > > > >                   |
> > > > > > > > > >                 TB3 Hub
> > > > > > > > > Should be more like this
> > > > > > > > >   AMD Host <-> Dell TB4 Dock <-> OWC Envoy Express (1-502=
)
> > > > > > > > >                              \
> > > > > > > > >                               <-> OWC Envoy Express (1-70=
2)
> > > > > > > > > or
> > > > > > > > >   AMD Host (1-0, domain1)
> > > > > > > > >       |
> > > > > > > > >       =E2=94=94=E2=94=80 Port 2 =E2=94=80=E2=94=80=E2=86=
=92 Dell Thunderbolt 4 Dock (1-2)
> > > > > > > > >                       =E2=94=9C=E2=94=80 Port 5 =E2=94=80=
=E2=94=80=E2=86=92 OWC Envoy Express (1-502)
> > > > > > > > >                       =E2=94=94=E2=94=80 Port 7 =E2=94=80=
=E2=94=80=E2=86=92 OWC Envoy Express (1-702)
> > > > > > > >
> > > > > > > > Okay so the same ;-)
> > > > > > > >
> > > > > > > > > > What if you run 'lspci' after the issue reproduces? Doe=
s that bring the
> > > > > > > > > > missing PCIe devices? I suspect that this is due to old=
er TB3 devices that
> > > > > > > > > > they may need bit more time to get the PCIe link (going=
 over the tunnel) up
> > > > > > > > > > and running.
> > > > > > > > > lspci doesn't bring back the missing tbt storage.
> > > > > > > >
> > > > > > > > Forgot to mention that let it (the whole topology) enter ru=
ntime suspend
> > > > > > > > before you run lspci.
> > > > > > >
> > > > > > > https://people.canonical.com/~acelan/bugs/tbt_storage/dmesg_l=
spci.log
> > > > > > >
> > > > > > > The behavior is strange, the following 3 devices keep enterin=
g D3cold and then comes back
> > > > > > > to D0 quickly. So, I'm not sure if the lspci do the actions y=
ou want.
> > > > > >
> > > > > > Yes. I should have mentioned so the lspci is there exactly to t=
rigger
> > > > > > runtime resume of the topology. I was hoping the PCIe links get
> > > > > > re-established properly then.
> > > > > >
> > > > > > Can you do so that you:
> > > > > >
> > > > > > 1. Plug in the dock.
> > > > > > 2. Plug in the other storage to the dock.
> > > > > > 3. Block runtime PM from the PCIe Downstream Port that should l=
ead to the
> > > > > >    second storage device PCIe Upstream Port
> > > > > >
> > > > > >  # echo on > /sys/bus/pci/devices/DEVICE/power/control
> > > > > >
> > > > > > 4. Connect the second storage device and enable PCIe tunnel.
> > > > > >
> > > > > > Does that make it work each time?
> > > > > Yes, follow the steps makes it work.
> > > > >
> > > > >    echo on | sudo tee /sys/bus/pci/devices/*/*/power/control
> > > > >
> > > > > Re-plug the dock, need to disable the runpm again.
> > > >
> > > > But can you just block it from the PCIe Downstream Port that leads =
to the
> > > > "non-working" storage before you enable PCIe tunnel? Not for all th=
e
> > > > devices.
> > > >
> > > > (let me know if you want help locating the correct device).
> > > >
> > > > Does it still work?
> > Here's the full PCI device chain graph:
> >
> >     0000:00:01.2 - AMD PCI Root Port
> >         |
> >         =E2=94=94=E2=94=80 0000:61:00.0 - Intel Thunderbolt 4 Bridge [G=
oshen Ridge 2020]
> >                |
> >                =E2=94=94=E2=94=80 0000:62:02.0 - Intel Thunderbolt 4 Br=
idge [Goshen Ridge 2020]
> >                       |
> >                       =E2=94=94=E2=94=80 0000:83:00.0 - Intel TBT3 Brid=
ge (Upstream Port) [Alpine Ridge LP]
> >                              |
> >                              =E2=94=94=E2=94=80 0000:84:01.0 - Intel TB=
T3 Bridge (Downstream Port) [Alpine Ridge LP]
> >                                     |
> >                                     =E2=94=94=E2=94=80 0000:85:00.0 - S=
andisk PC SN740 NVMe SSD (nvme2)
> >
> > When the tbt storage is not recognized, we don't have 83:00.0 and its
> > downstream port 84:01.0.
> >
> > $ ls /sys/bus/pci/devices
> > 0000:00:00.0  0000:00:02.1  0000:00:08.1  0000:00:18.1  0000:00:18.7  0=
000:62:04.0  0000:c3:00.0  0000:c5:00.5  0000:c7:00.4
> > 0000:00:00.2  0000:00:02.3  0000:00:08.2  0000:00:18.2  0000:61:00.0  0=
000:a2:00.0  0000:c4:00.0  0000:c5:00.7  0000:c7:00.5
> > 0000:00:01.0  0000:00:02.4  0000:00:08.3  0000:00:18.3  0000:62:00.0  0=
000:a3:01.0  0000:c5:00.0  0000:c6:00.0  0000:c7:00.6
> > 0000:00:01.1  0000:00:02.5  0000:00:14.0  0000:00:18.4  0000:62:01.0  0=
000:a4:00.0  0000:c5:00.1  0000:c6:00.1
> > 0000:00:01.2  0000:00:03.0  0000:00:14.3  0000:00:18.5  0000:62:02.0  0=
000:c1:00.0  0000:c5:00.2  0000:c7:00.0
> > 0000:00:02.0  0000:00:08.0  0000:00:18.0  0000:00:18.6  0000:62:03.0  0=
000:c2:00.0  0000:c5:00.4  0000:c7:00.3
> >
> > Disable runpm on 62:02.0, then we have 83:00.0 and its downstream port
> > 84:01.0 and 85:00.0, and then the tbt storage is recognized.
Got troubles with mutt, my reply got rejected :(

Using gmail and copy/paste the content below again.
>
> Okay that means there is nothing wrong with the PCIe tunnel itself it's
> just that the PCIe side either does not get the PME or does not see that
> the PCIe link becomes active (e.g the PCIe Downstream Port runtime suspen=
ds
> itself before the link status changes).
>
> PME work so that there is wake first on Intel it's GPE that wakes up the
> root port and then PCIe stack wakes up devices and then the PME message i=
s
> sent to the root complex.
>
> If you do this on Intel host do you see the same?
Intel host exhibits another symptom, I think the root cause is different.

Plug in the dock, and then plug in the tbt storage to the dock one by
one, both storage can be detected.

Plug both tbt storage to the dock, and then plug in the dock to the
machine, only one tbt storage appears. In rare chance, both tbt
storages show up, but most of the time, only one tbt storage is detected.
In this case, none of disable runpm, rescan, or lspci work. So, it's
most likely another issue.
>
> >
> > $ echo on | sudo tee /sys/bus/pci/devices/0000:62:02.0/power/control
> > on
> >
> > $ ls /sys/bus/pci/devices
> > 0000:00:00.0  0000:00:02.1  0000:00:08.1  0000:00:18.1  0000:00:18.7  0=
000:62:04.0  0000:a4:00.0  0000:c5:00.1  0000:c6:00.1
> > 0000:00:00.2  0000:00:02.3  0000:00:08.2  0000:00:18.2  0000:61:00.0  0=
000:83:00.0  0000:c1:00.0  0000:c5:00.2  0000:c7:00.0
> > 0000:00:01.0  0000:00:02.4  0000:00:08.3  0000:00:18.3  0000:62:00.0  0=
000:84:01.0  0000:c2:00.0  0000:c5:00.4  0000:c7:00.3
> > 0000:00:01.1  0000:00:02.5  0000:00:14.0  0000:00:18.4  0000:62:01.0  0=
000:85:00.0  0000:c3:00.0  0000:c5:00.5  0000:c7:00.4
> > 0000:00:01.2  0000:00:03.0  0000:00:14.3  0000:00:18.5  0000:62:02.0  0=
000:a2:00.0  0000:c4:00.0  0000:c5:00.7  0000:c7:00.5
> > 0000:00:02.0  0000:00:08.0  0000:00:18.0  0000:00:18.6  0000:62:03.0  0=
000:a3:01.0  0000:c5:00.0  0000:c6:00.0  0000:c7:00.6
> >
> > BTW, rescan also workaround the issue
> >
> > $ echo 1 | sudo tee /sys/bus/pci/devices/0000:62:02.0/rescan
> > >
> > > (+Gil)
> > >
> > > There is also one patch that fixes the driver to follow more closely =
the CM
> > > guide and that's related to the PCIe tunneling and may actually expla=
in the
> > > issue you see:
> > >
> > >   https://lore.kernel.org/linux-usb/20260127094953.GF2275908@black.ig=
k.intel.com/
> > >
> > > Note it only does that for USB4 routers so you may need to tune that =
so
> > > that it skips that check but there is complication because IIRC LTTSM=
 bits
> > > do not match the USB4 ones. One thing to try is to just check the USB=
4 PCIe
> > > adapter side that it is in detect.
> > I applied this series directly on top of 6.19-rc6, and the issue
> > persists.
> >
> > Here is the modification I tried, but it doesn't work.
> >
> > diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.=
c
> > index 51fd05b3e341..0672d3e3c24e 100644
> > --- a/drivers/thunderbolt/tunnel.c
> > +++ b/drivers/thunderbolt/tunnel.c
> > @@ -302,14 +302,38 @@ static int tb_pci_pre_activate(struct tb_tunnel *=
tunnel)
> >         struct tb_port *up =3D tunnel->dst_port;
> >         int ret;
> >
> > -       if (!tb_switch_is_usb4(down->sw) || !tb_switch_is_usb4(up->sw))
> > -               return 0;
> > +       /*
> > +        * Try checking LTSSM state for both USB4 and TBT3 devices.
> > +        * Check at least the USB4 side if only one side is USB4.
> > +        */
> > +       tb_port_dbg(down, "PCIe downstream port: USB4=3D%d\n", tb_switc=
h_is_usb4(down->sw));
> > +       tb_port_dbg(up, "PCIe upstream port: USB4=3D%d\n", tb_switch_is=
_usb4(up->sw));
> >
> > -       ret =3D usb4_pci_port_check_ltssm_state(down, TB_PCIE_LTSSM_DET=
ECT);
> > -       if (ret)
> > -               return ret;
> > +       if (tb_switch_is_usb4(down->sw)) {
> > +               tb_port_dbg(down, "Checking PCIe downstream LTSSM state=
\n");
> > +               ret =3D usb4_pci_port_check_ltssm_state(down, TB_PCIE_L=
TSSM_DETECT);
> > +               if (ret) {
> > +                       tb_port_warn(down, "PCIe adapter not in detect =
state: %d\n", ret);
> > +                       return ret;
> > +               }
> > +               tb_port_dbg(down, "PCIe downstream adapter in detect st=
ate\n");
> > +       } else {
> > +               tb_port_dbg(down, "Skipping LTSSM check (not USB4)\n");
> > +       }
> > +
> > +       if (tb_switch_is_usb4(up->sw)) {
> > +               tb_port_dbg(up, "Checking PCIe upstream LTSSM state\n")=
;
> > +               ret =3D usb4_pci_port_check_ltssm_state(up, TB_PCIE_LTS=
SM_DETECT);
> > +               if (ret) {
> > +                       tb_port_warn(up, "PCIe adapter not in detect st=
ate: %d\n", ret);
> > +                       return ret;
> > +               }
> > +               tb_port_dbg(up, "PCIe upstream adapter in detect state\=
n");
> > +       } else {
> > +               tb_port_dbg(up, "Skipping LTSSM check (not USB4)\n");
> > +       }
> >
> > -       return usb4_pci_port_check_ltssm_state(up, TB_PCIE_LTSSM_DETECT=
);
> > +       return 0;
> >  }
> >
> >  static int tb_pci_set_ext_encapsulation(struct tb_tunnel *tunnel, bool=
 enable)
> >
> > $ sudo dmesg | egrep "PCIe|USB4"
> >
> > Plug the first tbt storage,
> >
> > [  460.465644] [1668] thunderbolt 0000:c7:00.6:  Port 4: 8086:15c0 (Rev=
ision: 1, TB Version: 1, Type: PCIe (0x100102))
> > [  460.891208] [3953] thunderbolt 0000:c7:00.6: 2:12: PCIe downstream p=
ort: USB4=3D1
> > [  460.891210] [3953] thunderbolt 0000:c7:00.6: 702:4: PCIe upstream po=
rt: USB4=3D0
> > [  460.891212] [3953] thunderbolt 0000:c7:00.6: 2:12: Checking PCIe dow=
nstream LTSSM state
> > [  460.891327] [3953] thunderbolt 0000:c7:00.6: 2:12: PCIe downstream a=
dapter in detect state
> > [  460.891328] [3953] thunderbolt 0000:c7:00.6: 702:4: Skipping LTSSM c=
heck (not USB4)
> > [  460.891329] [3953] thunderbolt 0000:c7:00.6: activating PCIe Down pa=
th from 2:12 to 702:4
> > [  460.891849] [3953] thunderbolt 0000:c7:00.6: PCIe Down path activati=
on complete
> > [  460.891850] [3953] thunderbolt 0000:c7:00.6: activating PCIe Up path=
 from 702:4 to 2:12
> > [  460.892375] [3953] thunderbolt 0000:c7:00.6: PCIe Up path activation=
 complete
> > [  461.018893] pci 0000:a2:00.0: [8086:15c0] type 01 class 0x060400 PCI=
e Switch Upstream Port
> > [  461.019746] pci 0000:a2:00.0: 2.000 Gb/s available PCIe bandwidth, l=
imited by 2.5 GT/s PCIe x1 link at 0000:00:01.2 (capable of 8.000 Gb/s with=
 2.5 GT/s PCIe x4 link)
> > [  461.020620] pci 0000:a3:01.0: [8086:15c0] type 01 class 0x060400 PCI=
e Switch Downstream Port
> > [  461.021846] pci 0000:a4:00.0: [144d:a809] type 00 class 0x010802 PCI=
e Endpoint
> > [  461.022555] pci 0000:a4:00.0: 2.000 Gb/s available PCIe bandwidth, l=
imited by 2.5 GT/s PCIe x1 link at 0000:00:01.2 (capable of 31.504 Gb/s wit=
h 8.0 GT/s PCIe x4 link)
> >
> > And then the second tbt storage,
> >
> > [  472.025559] [1668] thunderbolt 0000:c7:00.6:  Port 4: 8086:15c0 (Rev=
ision: 1, TB Version: 1, Type: PCIe (0x100102))
> > [  472.451726] [3953] thunderbolt 0000:c7:00.6: 2:11: PCIe downstream p=
ort: USB4=3D1
> > [  472.451728] [3953] thunderbolt 0000:c7:00.6: 502:4: PCIe upstream po=
rt: USB4=3D0
> > [  472.451729] [3953] thunderbolt 0000:c7:00.6: 2:11: Checking PCIe dow=
nstream LTSSM state
> > [  472.451851] [3953] thunderbolt 0000:c7:00.6: 2:11: PCIe downstream a=
dapter in detect state
> > [  472.451852] [3953] thunderbolt 0000:c7:00.6: 502:4: Skipping LTSSM c=
heck (not USB4)
> > [  472.451853] [3953] thunderbolt 0000:c7:00.6: activating PCIe Down pa=
th from 2:11 to 502:4
> > [  472.452373] [3953] thunderbolt 0000:c7:00.6: PCIe Down path activati=
on complete
> > [  472.452374] [3953] thunderbolt 0000:c7:00.6: activating PCIe Up path=
 from 502:4 to 2:11
> > [  472.452893] [3953] thunderbolt 0000:c7:00.6: PCIe Up path activation=
 complete
> >
> > My issue should be happening after the PCIe tunnel is activated.
>
> Right at that point the PCIe Downstream Port probably is already back
> runtime suspended.
>
> Here you could try this:
>
> # echo 250 > /sys/bus/pci/devices/0000:62:02.0/power/autosuspend_delay
No luck, I enlarged the number to 1000, but still can't recognize the
second tbt storage.

I tried to wake up the PCIe ports in the beginning of tb_tunnel_pci() and
it works.

+       pdev =3D pci_get_domain_bus_and_slot(0, 0x62, PCI_DEVFN(0x02, 0));
+       if (pdev) {
+               if (pdev->dev.power.runtime_status =3D=3D RPM_SUSPENDED)
+                       pm_runtime_get_sync(&pdev->dev);
+               pci_dev_put(pdev);
+       }

But I can't find a generic way to get the bus and slot number, and
would you consider this a feasible approach?

>
> It should keep the port wake little more longer hopefully it can then cat=
ch
> the link becoming active.

