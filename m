Return-Path: <linux-usb+bounces-21711-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4E4A5ED65
	for <lists+linux-usb@lfdr.de>; Thu, 13 Mar 2025 08:55:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B23903A91CA
	for <lists+linux-usb@lfdr.de>; Thu, 13 Mar 2025 07:54:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 933F225FA11;
	Thu, 13 Mar 2025 07:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B9u444tV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162E5F9E6
	for <linux-usb@vger.kernel.org>; Thu, 13 Mar 2025 07:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741852498; cv=none; b=jBw5FlYMV+deivfLwsvJKPVdBCxXbQMCUzv5AlO6dGrf/B8/aK9HDmXFPeR+PtStGLNRJ3ZztNhX56CUVBc+S8Oq2pAxe2eIXAAxqT7Chbgviv8dvQKT1SUI3KgzkbRDKB4fzUzlI/xYgiReFVihABcwcOh7fySlXhBZ5oKFElI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741852498; c=relaxed/simple;
	bh=Mfs3QaZHMTp8DXgfmREbqcBvrNMdAa+kb7VdiqhwN5g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ooxrGeAh6+3xBMhw6N0MgdDHHqpqAyr3tqzh21iCzX/uDR1iIN9o58c4T69TPXQFqBHarfNq9tZnSibWB8I0QbPr6HCLAprBzSHN3cwV5WTxN9CO22tvuJ1NjgxvGfCzXZmygoLICfP4n9iaCevtaJBPVAgneEArkXGiZenuvgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B9u444tV; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac2bdea5a38so113936566b.0
        for <linux-usb@vger.kernel.org>; Thu, 13 Mar 2025 00:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741852493; x=1742457293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bHWJbsLqPwbNPTQAVSxpbbkotnH2Fq9Yu+RIulL5maw=;
        b=B9u444tVXXK1KGebiJwn85/rGMGZdhfdb/k6hozwlgiZRzATB6v6I6bRoNzhZtFKlg
         052o1PjsmVx+XvLWYBywl8WiO71EoFqBjQhy7voW58MdVtpaREbdzXuplw4b0itPjBn+
         MrRkcv7xF6D+al3o2X1HBCDrWJPY58FW+8NMmGfZIXp1hUnv9trFkDA7XtITpldvw9+V
         TCvlTN4BZnyD2uTcErfF0FdwodT/CCssdcVNm/dOq/NwLY3rKc0I6MHiXZ3aV4//G/bY
         /YxUVXxQgrEmcPOhSAR0uqjCkFuNrRUKJqNsGNWZdN9D9W0ntOThXQTRrME/Ibb1vrDo
         PFJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741852493; x=1742457293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bHWJbsLqPwbNPTQAVSxpbbkotnH2Fq9Yu+RIulL5maw=;
        b=FPjd8ncL59AGwozxR3SiYnzIbuQ3OvIi9e3ZK4hUN2suvtNPn8rzoX1eNrgYwJUL8W
         FoDeeZy9KhW30RTpL1t1iW/hCYlTmlV4hqF2dDi0MBYwWjeMHxMgiyOYiKOCmUXgyvkS
         hJ7KIPylBw3cT80OMc0ka9jQ/rxL8YG31jNHy98w/AGJCeaku1x4FBduecaNX64d8MP6
         apgjAp9cfd4Jw/AlOviY6PXc9tgM2lM/roZz+lmOMCl0oWoG4IBljxZGWrewdGW7uYnb
         DzEqh0Df/051+r2kqrtoLF8bzrm+rpjBuf5nKV8FqyAbP/qr9udVxpQGkLRDU+gMmPQX
         AKZg==
X-Gm-Message-State: AOJu0YwJGuLOgeWaq4HIo2ktrs3YM19/FfJ2ceYwpCJYNtDhQu82Lt18
	30oPw+gVL3KRr0Yeqz6Ohc/reEXZTozTI2NpZsdwZ4FRZmRsBgL/yFtmmQ==
X-Gm-Gg: ASbGncs/H2WKCJpyouhsMz3bFLe/ND6h3BwL6wRn/Wfj8ZKYDrFXXnvEH1Ws1AoXjEE
	C+ei6fahGt8THrOX3YggAiKL/q/XWGQmssSaNNm11+OOvOe3OWYORXtklueAjPLTNovTLikvbnW
	jetKqHw12OMD+ZZeIUGMwnErsr3bYFa1Hw7X+gcG282ujUC7BzQQ5gZ7bcJ1vp/C8RnAdigYJWs
	fBPo3arWf0Zv0BtUY+4w6dgEcd71FyTcroZY7K2N/hQmuorzCNxeQi8mdQErmiZ30HCdHkHIKeV
	jrp6wyRdFNXTuZvDdakT1bHRjt426Tb3S94nvTE7vyDW0W5OV4594CdI9z0=
X-Google-Smtp-Source: AGHT+IHkjb0YLdGFu5SkzMFlsiFtonRZpfzBBqSzI5NT/uoND0wV21LLkPCH2F3UdDvmCOZZtBEhEQ==
X-Received: by 2002:a17:907:3e91:b0:ac3:d1c:1a33 with SMTP id a640c23a62f3a-ac30d1c1ca6mr186687366b.54.1741852492785;
        Thu, 13 Mar 2025 00:54:52 -0700 (PDT)
Received: from foxbook (adth23.neoplus.adsl.tpnet.pl. [79.185.219.23])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3146af06asm49727866b.7.2025.03.13.00.54.51
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 13 Mar 2025 00:54:52 -0700 (PDT)
Date: Thu, 13 Mar 2025 08:54:47 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: My transfer ring grew to 740 segments
Message-ID: <20250313085447.7f6ba6ea@foxbook>
In-Reply-To: <c6866ac0-9a08-4b21-b620-5dcc9ae70611@linux.intel.com>
References: <20250311234139.0e73e138@foxbook>
	<c6866ac0-9a08-4b21-b620-5dcc9ae70611@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 12 Mar 2025 15:37:12 +0200, Mathias Nyman wrote:
> On 12.3.2025 0.41, Micha=C5=82 Pecio wrote:
> > Class driver enqueues its URBs, rings the doorbell and triggers this
> > error message. The endpoint halts, but that is ignored. Serial
> > device is closed, URBs are unlinked, Stop EP sees Halted, resests.
> > No Set Deq because HW Dequeue doesn't match any known TD. Rinse,
> > repeat. =20
>=20
> Ok, so this means endpoint does get reset, and once restarted it
> tries to transfer the same TRB, which again fails with Transaction
> error.

Yes. It makes me wonder whether it even makes sense to reset endpoints
in cases when the halted TD cannot be identified and skipped with Set
TR Dequeue. We don't know if it got td_to_noop(), and even if it did,
there is no guarantee that the HC flushes TRB cache before retrying.

If connection is lost permanently, this situation at least is safe.
But if it's a temporary Transaction Error or Stall then a future URB
may cause this stale TD to execute, affecting device state without
class driver's knowledge and using a retired data buffer.

Since every known halted TD is cancelled rather than given back, having
a halted EP with no TD to blame appears to generally be a bug. In this
case, finish_td() failed to recognize and handle the halt. And papering
over this problem with a reset didn't make it go away.

> > Maybe finish_td() should be more cautious? =20
>=20
> Good point, finish_td() should probably trust ep_state flags set by
> driver first.

Actually, finish_td() is supposed to call xhci_handle_halted_endpoint()
which then sets EP_HALTED. It could do so more reliably by trusting the
spec and assuming that every Tr-Error or Babble halts the endpoint
(with exceptions for isochronous and babbling 0.95 control endpoints).

4.8.3 instructs to assume that EP is halted after these errors and
warns that EP Ctx may not always be up to date, although Promontory
seems to (randomly) never update it at all, even 90ms later.

For now, I tried this simple hack and it solved the Promontory problem.
The message gets printed sometimes, but nothing worse happens.

@@ -2254,8 +2254,8 @@ static void finish_td(struct xhci_hcd *xhci, struct x=
hci_virt_ep *ep,
                                                 td->start_seg, td->start_t=
rb));
                                return;
                        }
-                       /* endpoint not halted, don't reset it */
-                       break;
+                       xhci_info(xhci, "slot %d ep %d comp_code %d but not=
 halted?\n",
+                                       ep->vdev->slot_id, ep->ep_index, tr=
b_comp_code);
                }
                /* Almost same procedure as for STALL_ERROR below */
                xhci_clear_hub_tt_buffer(xhci, td, ep);

BTW, I'm reproducing this bug in a much simpler way, not involving any
dodgy hub. I use a full speed device (a PL2303 serial dongle) and
disconnect its D- line after enumeration. This brakes communications,
but disconnection is not reported because D+ line is still pulled up.

