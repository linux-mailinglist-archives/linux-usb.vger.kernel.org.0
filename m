Return-Path: <linux-usb+bounces-37578-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eF0pOCK8CmrG6wQAu9opvQ
	(envelope-from <linux-usb+bounces-37578-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 09:13:38 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CBA5673E0
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 09:13:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 18A913019103
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 07:13:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FA203DEAF6;
	Mon, 18 May 2026 07:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dtLmb3G6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7D13DE439
	for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 07:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779088414; cv=none; b=sv0jO79YtakdcFcMSPq+NYYghgbo+G9MsQ3ChTfdDEUnK1PUmO+QvQ7XCIe+vQVB6Y5YhvO7gIl8giWB8LhQp3EiW+bcTZyyGLTDdazvEJMtFWWkA6CSkpsB2fiMHp0hWNTdOZjeyFqMCF8hzfI4qWqan674uaf3AUo7AvdPS2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779088414; c=relaxed/simple;
	bh=Rrvsonqi2yIcxCPDdFDknt6WL01mqPR39hn2QUHgI1w=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rBdpfRlQtIsRUVLolEDgPtLcgIJF0tt9XEtZjWt85mxkyX8zlQI53jvkf2ibad9ILTMcaUw++tOFlIBmH1mbStFu+lxVU1s/+S7xGbsIHbl6v3AattiBaDeUSn7gW7esZCu4Io4rpujSgS9SY5Ov7V4sM1ptRITIkNe+11ic/aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dtLmb3G6; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-449de065cb3so1782221f8f.2
        for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 00:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779088411; x=1779693211; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FAsqd1yDBTOZqtalJnVpjcTyCLyCi3nHRY+aOQmI2Q0=;
        b=dtLmb3G6BBm8Vr9gASsjTo6jEqdJ2WzDimu/g4agF0Jsiy6qnWkTG6BT9Fc7LA3IYF
         GjggHYdQd9FE/B4rF/X+ATc1jt+VNrair0WHrZIYUKmJdZvuDL0pVgM+FWiX+ZfFzTFy
         4gVV3vodSf8Zu8Pfw6M/pVZFbfwcBW1PtlMxTa8g+E2PvrA8Wn/taqvRVH9VGkCONC1X
         eXGDowaMybULRaTZvgQlM4/Br+g0p8Ufnh1A3Y/4zsoV8Dhl1bPQp2L83MDhSGLtBBYl
         2i4edJ6mxzsRpcWkCnYdI7OcQS5yHNKYiiP5M8IJZCeUzYAbbPu8rNb15N8iKNnA+5eF
         MImQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779088411; x=1779693211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FAsqd1yDBTOZqtalJnVpjcTyCLyCi3nHRY+aOQmI2Q0=;
        b=M37B1okePLG95ihqJtBtXRuCxDQqQX+1MZvKlIDZ/i4cnnyoz2zS9iaGyRPkxrD5cB
         2Fw7Ld9KOvSZjTXXsDcmtI4E0TJrzlGw9eoXdQOOAhMvSyDFGiBMpcxhnyFvbXYr90fm
         9Yhstxfyfek6tl3kNGls794v90M0wjPOdKY9utAKF/9QDZh5FHB3581G5DDDXX/0VXcI
         yExqJDG2yZ+nOV3Vs8mtn2nL3jDJ48GwLuIqGwBl+hsVLVulKcdDT0o1LcjmTXWGjgA+
         tq/n2jE5Liz2sPlEYlK5ZGglHV4WIyByQCS6VUjVdgce6D1rx4vIr+cEEMRUXKrHrazh
         Gnwg==
X-Forwarded-Encrypted: i=1; AFNElJ9cSJ1OuGXtcnt2fBiHOX1EYCSJC4u+BQ30d4LKJhPxxWqWzMQGX2/S9Ns7mOz02FNmDi/iELCcBvs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDMC68rI5SL8kdYcWrF+319Y/QZe90ftTnAT0sSDxZ2CG1V5PX
	3EW4PUOMXp5bUi82kvQje6va0yiPQ8XsI4ePGWfTGDAviDqTstJdsQLS
X-Gm-Gg: Acq92OHFXxkBWFC8phYiZu2XmtrpcSkVs1fhStXailRApMqEEwsFLV2E1haYNGd62If
	eGVGi7KPm0ZNk9m9ZiBUZuIBNCzYNGyggH4JTqYZzLb+MpGjQYxtywDnuYVa8EGruyKGwNaQE6D
	9p6bd3h1rYMBw+KuGzzTFjuoRcML9cgSni43Whkh5DPLoUZ1xTH0V/B7PY7kizEPzhYElC1TofL
	6AzhP4BfYbjZZm+Ed57rgYrPPjfSi6EJB1E9508TJvk8xUGErIRlWkMEFI/AWT7n0h3DZtQruMs
	k5E+kwAqAFWpsRQVbjW3oV2fz1wHuP5HdIYNHdrwaVIhNZfpwOB2WXN8p+sjm2QZuhYyhstDiXx
	OEscm/kFVVeLf7DF1ChdpQyaPdtBDZAtUsG7biXt/hA9S9klJGJ+wZ/38vBXCYf7+1jFYpSBBD1
	3aH4uSy2ut30scigcEZ1ghYNV7YZkKmW/i
X-Received: by 2002:a05:6000:2902:b0:45a:e3dd:586b with SMTP id ffacd0b85a97d-45e5c59a269mr21533158f8f.18.1779088410925;
        Mon, 18 May 2026 00:13:30 -0700 (PDT)
Received: from foxbook (bfk48.neoplus.adsl.tpnet.pl. [83.28.48.48])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e768acesm37387905f8f.7.2026.05.18.00.13.30
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 18 May 2026 00:13:30 -0700 (PDT)
Date: Mon, 18 May 2026 09:13:27 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Dylan Robinson <dylan_robinson@motu.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>,
 linux-usb@vger.kernel.org, mathias.nyman@intel.com,
 stern@rowland.harvard.edu
Subject: Re: [RFT PATCH] xhci: fix frame id calculation for isoc transfer
Message-ID: <20260518091327.470d8fb5.michal.pecio@gmail.com>
In-Reply-To: <CA+Df+jc=z96K52NJ6YXG4x8gK95udcbFHs=0hTQS6cm1r8z0zw@mail.gmail.com>
References: <CA+Df+jeoj_QL6XNzUyP963HF7ngCWoAs0MjqQXPr3Fa6VW3rXw@mail.gmail.com>
	<20260511192105.3756809-1-mathias.nyman@linux.intel.com>
	<20260512110810.17fbde0a.michal.pecio@gmail.com>
	<85f8441d-d6c0-4607-9269-d80b1294afbd@linux.intel.com>
	<CA+Df+jf79bnONyXUnf0_zAUrqNAVzy1zt9VCivbxYvkedfGHRQ@mail.gmail.com>
	<20260515063210.4ed0a940.michal.pecio@gmail.com>
	<CA+Df+jc=z96K52NJ6YXG4x8gK95udcbFHs=0hTQS6cm1r8z0zw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 57CBA5673E0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-37578-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Fri, 15 May 2026 14:13:14 -0400, Dylan Robinson wrote:
> On Fri, May 15, 2026 at 12:32=E2=80=AFAM Michal Pecio wrote:
> > Did you try with short enough playback buffer to get occasional xHCI
> > ring underruns?
> >
> > Is Frame ID still correct then? =20
>=20
> Good point, no, it does not remain correct.
>=20
> I repeated the test using 1-microframe-long URBs in order to induce
> ring underruns/overruns.

Underruns are the most important thing to test here, both with CFC and
without. Under normal conditions these patches have no effect (besides
possibility of blatant bugs), but when the ring underruns we want to
know how the HW and SW will react to it.

> When the URB_ISO_ASAP flag is not set, urb->start_frame is initially
> accurate, but drifts further and further off following each ring
> underrun/overrun event. In the completion handler, urb->start_frame
> appears to remain continuous with the previous URB even after
> underrun/overrun events occur. The URB completion status and the
> isochronous frame descriptor statuses always report success.

Yes, this is very annoying because it's undetectable (without CFC).
It seems we need to handle Ring Underrun/Overrun events, somehow.

So far the only successful handling I found was to delay completion of
the next URB by 1ms, which caused snd-usb-audio to underrun its buffer
and restart the stream :)

I also tried:

1. Violate the 1.0 spec and write Frame IDs instead of SIA to all TDs.
HCs respond oddly, some skip more than they should, some get stuck when
Frame ID is in the past (probably wait for MFINDEX overflow).

2. Queue initial TDs of the next URB as No-Op TRBs and use Frame ID in
the first TD which meets IST. But HCs handle isoc No-Op TDs oddly too:
- Renesas ignores Frame ID in an Isoch TD following a No-Op TD
- Fresco executes only one No-Op per interval
- VIA re-runs the No-Os sequence each interval until Frame ID is met
  in the subsequent Isoch TD

3. Don't queue inital TDs at all. This turns out to violate assumptions
   made in various parts of the driver. PITA, WiP, kernel panics etc.

Regards,
Michal

