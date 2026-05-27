Return-Path: <linux-usb+bounces-38110-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEQEMEtTF2oPBQgAu9opvQ
	(envelope-from <linux-usb+bounces-38110-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2026 22:25:47 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1495EA070
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2026 22:25:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 59060310A7F9
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2026 20:20:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F7B93B777B;
	Wed, 27 May 2026 20:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=motu.com header.i=@motu.com header.b="JTFe8QHF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500F93B1031
	for <linux-usb@vger.kernel.org>; Wed, 27 May 2026 20:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779913254; cv=pass; b=eSiMNg/+DQRCRnvQNxAEFkh2mxCnoD6CBLE9gY6F7JjEO3AwwsJmZKOAuOiyy8pOIfwdml1U7bUR+Cm08oLhSzQ4L1SDZaN4Iw4dnbsSxFYqRDwxKbxnXiFF0cSHc4dJRLBrgD+DLWsJ9Uc/xmvSsmEz344feC+oKfHHh6W/7Wo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779913254; c=relaxed/simple;
	bh=h/FDKdwKoKoDYux97LgThXLbdK2kP2FL5xrSZvoeXCU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oQB+EypAOwt4qPFDeS7qXezp/lUT3D2MvxXsIkyQlEnJ4dJZ4Q/Ow4MJ5wWHlGBMl8cn2N3j7k5C8F6mPyomQ0JPybktV9slbXirr+GESSWws5YRuVvSHMxrUSmPEBWg3yOKM3HujgOKVMlOGSppD2rjaw+uZ25YygoCjWyjOVg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=motu.com; spf=pass smtp.mailfrom=motu.com; dkim=pass (1024-bit key) header.d=motu.com header.i=@motu.com header.b=JTFe8QHF; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=motu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=motu.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6870a365c77so14732645a12.0
        for <linux-usb@vger.kernel.org>; Wed, 27 May 2026 13:20:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779913252; cv=none;
        d=google.com; s=arc-20240605;
        b=MojPsxb5lDUMxuEq5HI8zhcthxvqOjpFPr/LRw6yFm3HzS+q9IQaDmzHkaZVtPx/5K
         NL+FNQDjV3+gTC6GF9xoEJYUWy/qbhtHB8xRXDPMjLgQBEuFUEavsPM5ZRjz1wfLQ7fb
         qZZNqAtNU7lW/7A9UhX9tZ2JvUXstKUHeCNhJc/A+xe2P5RdvBEb2XYWTXE1kUs767nl
         mcPpNaoJGtINjT/pdlgfJQIyWtPX3XPY9N42KFNvpvQjz6C1H5XU1WnArfU/siE3s4yw
         qXX+/e0vg8gbKJ1z1z5IATvLQI15zX8WX5wQtLO3z9mLGfE/m1f7ObBEfzifdNLWuLYz
         tbyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h/FDKdwKoKoDYux97LgThXLbdK2kP2FL5xrSZvoeXCU=;
        fh=81s0qE3zusW7t+f9T5fdCWzTEfC0Zq2S6Pk1d5e9kow=;
        b=AsyL1qyF7KhIQ3BNDKDT3ISTlaXIPGG8Wm00l3/adFRTGocj96F4o/2hZdxypPFTZx
         Bt8PYgX80IZuEuSeA7CVL5hXvdXWnDW73oAxOkPck7OYA2fE2uRcP1LGnDxyp5Vcd8gX
         rA/VYf1sP6uWcXQzHm9Fq5uvQYG2w/2tbOjcN+e541x1zwFVNpb98Rz6uNFL0eopLYhv
         N/N87L+jJ78VJrXVHvTz1crHoWdnXQkiE/H3xKtnAyWA0CmFDFCK0Q/0zz09JGxgc+kT
         sjZesVJujjO+AxgrRow8dFMo7Qsw2ega2eczR8oUOZtKliflnLVHUVVo0NslgWHfbE4M
         FJVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=motu.com; s=google; t=1779913252; x=1780518052; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h/FDKdwKoKoDYux97LgThXLbdK2kP2FL5xrSZvoeXCU=;
        b=JTFe8QHFIB/cl/nHH6Q7lx998aHK2UmkxP3zv8IwhoUnM6YKAwc1mijDhTUomp7++V
         kPHXPQAYJQO2/phZSkm07xsaUDU2QP2tEowFH52bGFkS/j4RFfbbZKNpWtAiLhnI6EDY
         1Nd0Wqqwd+13/VIPQxSKn52kjVD5CVP1870ik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779913252; x=1780518052;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h/FDKdwKoKoDYux97LgThXLbdK2kP2FL5xrSZvoeXCU=;
        b=Ql0qIQzDpI8qwflRqrziyzOVaXbnrf6x888eXQH3gdkubssxll3yYGeDolBX7fQBEe
         g40e+drA68bxI4nsYSRtKBDgBayVJZydLQzqIhUAXM8hj7gUItE4ayMDnDudPukmxYoy
         VOtXQHM8Dud3Vunt68yOdLvWGOmd9ljFmODjLZxaKy9LT7vHaLMz7aDKjlTl2WsXFwQn
         ukopSeQZ8c6sO52oz9uFFZjuvgznsxMd2/adhpfuSr2YBb7Be95W2wUQgDv+1HlSCkWn
         e/c1gNTAqpNRmHM2fi6k9A3vEeXnobb2qK0i4ssQKBBN60EkzD9q8rhG2zdAVfFNRaOd
         /Nrw==
X-Forwarded-Encrypted: i=1; AFNElJ/+kY9X7CO4wggxfW+Ny9z8ChfCmYUaqDDWwsCrCx1GA2ll9hs1Fx0smdzjxmU+cq1INkFVSazrLd4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyN6z1fq+1CF6Yw4Bd/jGQ5Eh8LxQfe3faOzocDTSPDRlja69C+
	tnphtR8SDVqIyHX5zDk5GWNNlXwcVIARK11eRJy/S/u8yU5B/qB/NJdXLA1G2z49rRqIAJ6BCkq
	LJgQASSfVfINnZA/P3Kv6Jrrua9laYZIf4a6eKq9oug==
X-Gm-Gg: Acq92OFo+8VY4sX8lO8IVbbv+dgd5xkqbMEwSa3w+vZcwO4c6jan5UjjJUUSaV03NTZ
	ZAqeMIT6vnbQi+Z7RbcdoPGMbyJLPAFy5FNvJeJ2t5OA/wVt6wrTNHw6kTJkClCt8NUhLOD+Iqr
	76Fjxkwjb6pioX+TfJHlQpZwHQlFbc8Nm3oRI5QbVleVYVtUJyKOe4jOgdYNbR3EFkF56OZmL2y
	vmH5qA0NdITW9mboKF909VmjM78NySUtBSumi+O9Y1oeflvtkyT0ZpecswMYbKKVftaFHoT3tkw
	opr3gp5qEJmogaMIIv0=
X-Received: by 2002:a17:907:3e99:b0:be2:cd33:213f with SMTP id
 a640c23a62f3a-be2cd332452mr576795066b.17.1779913251520; Wed, 27 May 2026
 13:20:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a67e11d4-6c80-4043-9f60-ae42a15ed0d3@linux.intel.com>
 <20260521152715.288995-1-mathias.nyman@linux.intel.com> <20260521152715.288995-3-mathias.nyman@linux.intel.com>
 <CA+Df+jcBu2zhzwfeT9AuWdK4QoqoQeJ1EB7nzRVvDMrcevQ1_A@mail.gmail.com> <20260526141505.455ab0c3.michal.pecio@gmail.com>
In-Reply-To: <20260526141505.455ab0c3.michal.pecio@gmail.com>
From: Dylan Robinson <dylan_robinson@motu.com>
Date: Wed, 27 May 2026 16:20:38 -0400
X-Gm-Features: AVHnY4ISdrDnG1urkMHUM7qB5JrEX7Of9hjgnBs8Kgei56KVTt3JZYaAt3-yeSI
Message-ID: <CA+Df+jfswGTNn4k2Jtg+5qEGNCcgLCL3ga_ftytD4vS=7fZ2mA@mail.gmail.com>
Subject: Re: [RFT PATCHv3 3/3] xhci: tune urb->start_frame in ring overrun and
 underrun cases
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, linux-usb@vger.kernel.org, 
	mathias.nyman@intel.com, stern@rowland.harvard.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[motu.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[motu.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38110-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dylan_robinson@motu.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[motu.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 1E1495EA070
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 26, 2026 at 8:15=E2=80=AFAM Michal Pecio wrote:
> On Mon, 25 May 2026 20:49:15 -0400, Dylan Robinson wrote:
> > I think the only way to prevent this drift would be to intentionally
> > introduce an additional gap so that the host controller driver can
> > restart the stream on a known frame.
>
> If we want to gamble that maybe a slight IST violation will still
> succeed anyway, this seems to be the only recovery when we lose.

Yeah, if this mid-stream recovery concern can be avoided by
disallowing IST violations in the first place, that seems like the
better approach. It took me a moment to understand what you were
getting at, but if an IST-violating transfer cannot be submitted in
the first place, then I think this problem mostly goes away. If a
driver wants to try violating the IST, it could just use the ASAP flag
instead, right?

> Either way, we need to fail certain IST-violating submissions with
> -EXDEV or complete them immediately with -EXDEV status. Which is what
> I was working on and finding various issues with (the driver doesn't
> expect queued URBs which aren't written to the ring). Unfortunately,
> it still isn't finished as I have little free time currently.

This makes sense, and I am starting to wrap my head around the various
requirements, so I may try putting together a patch as well, although
finding the time may be difficult for me too.

> By the way, do you know what Windows does in such cases?

I wasn't sure, so I ran some tests. Windows behaves somewhat
unexpectedly with IST-violating submissions. The observable behavior
appears to be mostly the same regardless of CFC.

Windows appears to always complete isochronous URBs with a success
status, regardless of whether the transfers actually occur on the bus
(yikes). When a transfer does occur, it appears on the exact frame
requested by the submission, whereas transfers that do not occur,
presumably because they violated the IST, may complete immediately
upon submission. Consequently, I saw URB completions occurring out of
submission order.

Best Regards,
Dylan

