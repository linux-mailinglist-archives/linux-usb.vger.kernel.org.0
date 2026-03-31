Return-Path: <linux-usb+bounces-35703-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MCJdGaUQy2lCDgYAu9opvQ
	(envelope-from <linux-usb+bounces-35703-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 02:09:09 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D35362920
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 02:09:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A54BE3028EEF
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 00:07:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A53DA1448D5;
	Tue, 31 Mar 2026 00:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b="Bi5w3av7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426D66BFCE
	for <linux-usb@vger.kernel.org>; Tue, 31 Mar 2026 00:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774915676; cv=pass; b=Y6zk/18KSkT2aZNJLuxP2dw5PIhVAhYW79DWSqH4sPjUReRGEOXRr2/STIHyMkartMhOj8tNg9Ue0nbHOhgXInRYLRyMEQFL1ZU+Nz4V34xsb5IlGHjjPVzgeUXYTMXSa2ptN9kJrX+V18UfGO5xeWwR0T+WS+W19ESrv15Y2jE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774915676; c=relaxed/simple;
	bh=kvNS4jrTKNThGiO49BMz7mXMS60LyAjy24E/Nzyru+8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=In+2Hh4MOjh1wTY1IGqhyhr4bpwK9KcLavXSFgmQ5u+vFjA/+Jds5aktKCJN/6UPo8C/ASmY9y50yV/44aNxU9yYjSgF73Fxzia4nOmxf+QQpfgrkgLburR4RhJnoXnJ1xdmZxiuut8iUw7EiNsueeqpLS9K67vQJFGKh/Cu7zs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com; spf=pass smtp.mailfrom=jphein.com; dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b=Bi5w3av7; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jphein.com
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-6500040f172so6454783d50.1
        for <linux-usb@vger.kernel.org>; Mon, 30 Mar 2026 17:07:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774915673; cv=none;
        d=google.com; s=arc-20240605;
        b=FtHQCv5myMx4l1AKsFSgvNZX4weErhT7yonrS01WlM67w1V0fQORHADpN+rzkq8io6
         tBOUfi2Nly5G9jVeQ3GY5xP0Xbt0N0RqHCW9mXOecAlBQZZg7iQZhC6dskQlUfK1nfTJ
         XpKV6Xibey8UnqP82r3ndKaC9LUDKawBZFh3+brH4bx1r/QVbqdFq3iL4MDC6ayUtJYv
         B//S89j2rR1JrJodyHxsAQ19lGJKmd/gXAWylAqlEuweihJXqko1wrkskXP9b10o2GaO
         THDytdG3NJahT1bTHRhY8XVq9Ujl8haHAFsxi3tfKW65WyNPQwf18Od65iwNgm6+d9cF
         G0Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0aiGgV4znT/MrEJo920Y34xdg0R+ZL3fdPeG6yCs7CI=;
        fh=DiXrfM1tHPqHihfcwlkyNUvqdBhHWUG/hwFfRd/lG2s=;
        b=JYOM07n5mafVVkDIynYU5AWRapByyUlcDopX98FJ8o2uLoJwVuwLdSFwFjSZ/Losgw
         c3wdAM/BfENkuyBpT7TWVu7Wp7BiNLvFw9XYSRVYTXEtKmH0M1u8M3qnVm2RIP7q7ive
         1eOTSbTYxpmu/gPs30spiAopXTdgJQJIZ7+4wwtRwLBJPWwXqL5hGyDFoQqWMPcOLLgl
         hNOEFneilA4XmRSRPvoaJ6iKL+neCMjIkFtq11uNN72lkRonpqwqDJtRNpTP7s6QjrXp
         CZ2aYYDHqRKFWlNK94rzpqiZfMb3cKwf8kAOOd7nNJrAwPv29Z/7tRsnD190GVmTqTP+
         UxWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jphein.com; s=google; t=1774915673; x=1775520473; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0aiGgV4znT/MrEJo920Y34xdg0R+ZL3fdPeG6yCs7CI=;
        b=Bi5w3av7VUE2o8tn1uwELmmXZV3F1N8z7zOf/hSAxiASLrMh3k8t1gOyQUoEm5PW/V
         2IlO05z8dgdBrX/vE/poN5ZX/nss0IE+aQYoZsNti6baBwaWs6Amjl3A/c5MF/rpgJIL
         qQJ716Ypaoi7KlBDcnMYIG1q33NB1tQhqU3wpK5N9ZRS6SfBf/J6x6vdWAVeUzItksdy
         3eAKQ61ckB0JCkxuTsQe6drnOZ6zdlwdZOFATbZB2WfUmqbdrHPP8aB6J4FpIHECzXiZ
         /+qlnhO+w50KZ9XYwV9mI5VcQivg7ZJp9a0qTy5ADqs067iqcP0oWczeR2ZqKMkg1xzM
         v4Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774915673; x=1775520473;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0aiGgV4znT/MrEJo920Y34xdg0R+ZL3fdPeG6yCs7CI=;
        b=QfjK3Bbs4xzup1IoZFWmCaXysce1XnCtKuuzTTDtVBnlTlDaUTrklqFM3SowmqkeuR
         ebIIEwhAnfIj9X8EGIkiK7oJVGDuLG92RfGWiX2HJiGVDmxI0DeIDeS0qEQVoUw0e34C
         AcD9FsHCycSSM6WYA575o8L0P+1NbtWcodUVYfMulu4w4cp7BUWW1wqH7IkzvIYzEmdr
         zI246oLNZDOj/1m0CLm0JEETs3bHSr96DoS+S4LyUZ+bAjJ00iLVt4M2m9SX1uUp00CJ
         KcX9nxoeQXVWXrbuVEVjVYrycPzkq04E05n9c5kknNqG3CnJwhKbqeeTIlpF4mXDLNd4
         nX+w==
X-Forwarded-Encrypted: i=1; AJvYcCXHvJ89YFFg+/ZtQfezM7t6fPicmVk4w+gz0E9/JE0x5BoI/9Ior7pYxM79di1lnbsyg+t1C8SVXYc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIIigPS64bw1v2xA9v+vmg6GhD1ponW1bzUz9WoNEYtOhmjIb2
	kGSHdjNiHhAiaxca5KWWBXqZyD2GdM6jX1LgPB+rXE1qrUmTG1eX22Gs/Kfn7vR+soB8cJBgbc5
	FiqhryrvaiqJqysTpWymTkke2FtdlPHROB2gnWKFsmi1dO1FmGNJ9jg==
X-Gm-Gg: ATEYQzxe6ELr+OL9PAZacGyapRFUKkGQUR2P7J6Ru/yBK93/sy732k/3Rz3Z0BGSmSs
	UA2VuhZNsfyYVVs8dpIbEmnDyeOeuxDpdNQd7l0+EcWPkzrQ/HL4pmczM4eDI59cK/Q/IcQ8VZh
	BL6zwuArBUEkkqfe7Apv7DOGFZ8lEXjeKlDImP7MB3oxguRohC3liOljOBlZsvPKCyDUgfEbWnw
	v5CT9hlO4SEK38+yNUa74t6aUAct2fV+LM9sdC+CUbiJ5aY3Twc7GeRUfeYbwCtPQmDDfa+2wNL
	pM/SsyJkIJiWsMQ=
X-Received: by 2002:a53:ac95:0:b0:650:19a8:2ae2 with SMTP id
 956f58d0204a3-65019a831a9mr6375585d50.25.1774915673080; Mon, 30 Mar 2026
 17:07:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260321223713.1219297-1-jp@jphein.com> <20260322055354.03399a32.michal.pecio@gmail.com>
 <CAD5VvzBE8Oq80EhFZnZ7kNrRC_rpoR25Ct5-Fg62yDZUHVtWzw@mail.gmail.com>
 <20260323085845.6bf57b3b.michal.pecio@gmail.com> <CAD5VvzDWF7SO0Aytp3K_uXV6ZYoqEqN1dhfv7VtMAHSpHP+qTA@mail.gmail.com>
 <20260329174022.6513d797.michal.pecio@gmail.com>
In-Reply-To: <20260329174022.6513d797.michal.pecio@gmail.com>
From: Jeffrey Hein <jp@jphein.com>
Date: Mon, 30 Mar 2026 17:07:41 -0700
X-Gm-Features: AQROBzC65uQWp9GEtVFzdYryhIRpVWhTdTI7oafhHvD_kOc7K_CrPhhba6QgsCM
Message-ID: <CAD5VvzA1XnNKk3W2sVP7fjPF_BNkkSQ2p_4xhwnE1yV8zFOhSg@mail.gmail.com>
Subject: Re: [PATCH 0/3] USB/UVC: Add quirks to prevent Razer Kiyo Pro xHCI
 cascade failure
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[jphein.com,reject];
	R_DKIM_ALLOW(-0.20)[jphein.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35703-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jp@jphein.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[jphein.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,techempower.org:url]
X-Rspamd-Queue-Id: 05D35362920
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Michal,

I spoke too soon. The stress test (rapid v4l2-ctl control transfers
with no video stream) passes on 6.17, but the crash still occurs
during actual use.

Starting a video call on 6.17.0-19-generic triggered the full
hc_died() cascade. No patches, no workarounds, stock kernel:

    usb 2-3.4: disable of device-initiated U1 failed.
    usb 2-3.4: Failed to set U2 timeout to 0x0,error code -110
    uvcvideo 2-3.4:1.1: usb_set_interface Failed to disable LPM
    usb 2-3.4: Failed to query (SET_CUR) UVC control 11 on unit 3: -71
    [errors escalate from -71 EPROTO to -110 ETIMEDOUT]
    usb 2-3.4: 3:1: cannot set freq 48000 to ep 0x82
    xhci_hcd 0000:00:14.0: xHCI host not responding to stop endpoint comman=
d
    xhci_hcd 0000:00:14.0: xHCI host controller not responding, assume dead
    xhci_hcd 0000:00:14.0: HC died; cleaning up

I also ran the stress test during an active video call with dynamic
debug enabled. The firmware locked up at round 19 of 50 with repeated
endpoint stalls:

    xhci_hcd 0000:00:14.0: Stalled endpoint for slot 17 ep 2
    xhci_hcd 0000:00:14.0: Giveback URB ..., status =3D -32
    [repeated every 2 seconds]

In this case the xHCI controller survived (no hc_died), but the camera
was frozen and needed a physical replug.

So the pattern is: the firmware cannot handle concurrent control
transfers while servicing isochronous streams. The stress test alone
passes because there is no isochronous load. Add video streaming and
the firmware falls over. The 6.8 -> 6.17 xHCI improvements help -- the
controller sometimes recovers instead of always dying -- but the
firmware lockup still occurs.

Full debug logs are at:

    https://github.com/jphein/kiyo-xhci-fix

I have dynamic debug enabled for xhci_hcd and usbcore going forward.

JP


On Sun, Mar 29, 2026 at 8:40=E2=80=AFAM Michal Pecio <michal.pecio@gmail.co=
m> wrote:
>
> On Sun, 29 Mar 2026 08:03:42 -0700, Jeffrey Hein wrote:
> > I have now tested on 6.17.0-19-generic (Ubuntu 25.04) with dynamic
> > debug enabled for xhci_hcd and usbcore, and without any of my proposed
> > patches or workarounds applied. No udev quirks, no LPM disable, no
> > control throttle -- completely stock kernel.
> >
> > Results: the stress test passes 50/50 rounds with 0ms delay. On
> > 6.8.0-106-generic the same test crashed consistently around round 25.
>
> Thanks for the update, that's good to hear.
> Hopefully it will still work without dynamic debug too.
>
> If you would want to fix the old 6.8 kernel you will need to talk with
> Ubuntu about it, because that version is no longer supported upstream.
>
> Regards,
> Michal



--=20
Jeffrey Pine Hein
Just plain helpful.
jphein.com =E2=98=80=EF=B8=8F techempower.org
(530) 798-4099

