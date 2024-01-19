Return-Path: <linux-usb+bounces-5298-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 874BF833081
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jan 2024 22:54:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E3B71F23A05
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jan 2024 21:54:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 888BB5823E;
	Fri, 19 Jan 2024 21:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QIN63NNa"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9597558230
	for <linux-usb@vger.kernel.org>; Fri, 19 Jan 2024 21:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705701280; cv=none; b=OqlXmUp03mBYMB+1+owS5aYmewXCSCW/UzoUdw16a8FLZi1XcJVVNSFHTkzXM5spthZjn8OGn5N5UXbWD/CK1TPZ2phTjToKwPfbN63enozYgAupDOfW3o4RGSbi4smdFv8//TLIFN6bKhZS+VdP3sfoszMN6hbnUBeKyvxgnEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705701280; c=relaxed/simple;
	bh=equ6s6vUJeJOOQSvF7kVReTf8Y0VHJV1q1MNiPmQZxI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UeS0pKvuIMTMROP+2jl69EmN6un56i834+pdq94FamgdXE6YnuC0st74wYPcNcczh8mq7fLm3YtEeh9qgzZe6xzWjenwSOoIC/1nSPG5v/T3o12XO8mkl2E97jaYljBF64x9zZ6TjGIDiw+7+ZWmgeNiA0vf1pT6m2qLCb/XhJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QIN63NNa; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-337d5480a6aso989215f8f.1
        for <linux-usb@vger.kernel.org>; Fri, 19 Jan 2024 13:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705701277; x=1706306077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GmQh8OKKdscfUFviwrBCLYjtv4x8bPDS6zqV9KkWyDw=;
        b=QIN63NNaG/LSajzgYbanZwJnE7wxhUgxP3F2upmzSuEIOJTwdscAqNClLb9QKGqFBW
         7h/K4i3Dd7QGSf0LAppUo6gdHJ7zm0tOYHdaHm7R6UF9NFkdiKFVuZ8VBNuhKXavmVmF
         zsOwFcOCmtdK42CfvvE4IXk6mtBlLrTpDi7QrYjBt4nG4HWUfshpCywcHszkoInijoDy
         vfvLzpXZoCouR1bA9/9eEHwPOF8m5+mkuxXD+P1RD+Ias+ksnOqEiOjw7a1/g8sNZ8m2
         tu1nY4eak2rIs5aUA5kD502gYTMWIaiszN3m0I491KDICGYxBCB15c2TlbFJrKpqroRr
         oHyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705701277; x=1706306077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GmQh8OKKdscfUFviwrBCLYjtv4x8bPDS6zqV9KkWyDw=;
        b=m/DSQWdvIl1VrXolct9iboA+PMMlavIYD7aP/FYxxKMiU8BVs9Wh+h9jBrWq8m/2eE
         L1zACrLUqlX50RaPO1CXm3CITayqaCu3eltt8m9DCW3VqPlDalXFChjD1KIFSmxURWGN
         NlhCL+FG4/0TJ24eIFMIpahMCEL7RqhAMLQh0IAl70eBZ05fUuuOCnyCHqEdQZT27Ilf
         XI1JJVpTudBcyXfKhH1s08WTriRJWoB/YbPzq7Mkb4u/cq2sC38A2Bzn3h3qwGOajVVz
         xb3WhQack4PiySrpQmLhkVEfOZnFCQXcaNZ2FkO0SwxBUxmsaplAq9hKGGwWRxSzmNqJ
         emZw==
X-Gm-Message-State: AOJu0Yw8GQNMbBkBjmpGJgOmLmrdH+t0JVQMTzM8M51oJP+4+rGx6Z/z
	3YUBnyKpXqJ4TvyOGej3MhrF6a72/9IYDKr2jMUh9hTQX/A9VAEirbHNWCMQ
X-Google-Smtp-Source: AGHT+IHiF+69EV7ziruImr6CJ4Us/cK5OpX+HGf0wnCIzx0309T8gBuyquePZg8B/VXPiNnoKRFQvw==
X-Received: by 2002:adf:b343:0:b0:337:bebf:1e05 with SMTP id k3-20020adfb343000000b00337bebf1e05mr195564wrd.38.1705701276574;
        Fri, 19 Jan 2024 13:54:36 -0800 (PST)
Received: from foxbook (bfd196.neoplus.adsl.tpnet.pl. [83.28.41.196])
        by smtp.gmail.com with ESMTPSA id lt18-20020a170906fa9200b00a2ac199ff67sm10858596ejb.170.2024.01.19.13.54.35
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 19 Jan 2024 13:54:36 -0800 (PST)
Date: Fri, 19 Jan 2024 22:54:32 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [RTF PATCH v3] xhci: process isoc TD properly when there was an
 error mid TD.
Message-ID: <20240119225432.78c2d35d@foxbook>
In-Reply-To: <20240119105835.2637358-1-mathias.nyman@linux.intel.com>
References: <2c2d8711-3d2b-e943-a2a0-75637e725dc3@linux.intel.com>
	<20240119105835.2637358-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Usual tests passed (but only transaction errors are covered).


I noticed that with your new fix to the frame length bug, error_mid_td
always equals urb_length_set. So the new flag is perhaps not necessary
after all. The test in handle_tx_event() could be:

if (usb_pipeisoc(td->urb->pipe) && td->urb_length_set &&
    !list_is_last(...  ))

I tried it and it works just as well.


While disconnecting my test camera from the VIA, I got this:

[95511.647441] xhci_hcd 0000:03:00.0: finishing TD with status -75 (comp_code 3 error_mid_td 0)
[95511.647453] xhci_hcd 0000:03:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 1
[95511.647457] xhci_hcd 0000:03:00.0: Looking for event-dma 0000000135121710 trb-start 0000000135121720 trb-end 0000000135121720 seg-start 0000000135121000 seg-end 0000000135121ff0
... followed by some ordinary transaction errors 2 milliseconds later.

Apparently a babble error, and it seems to have generated a "success"
which the event handler tried to match with the next TD. So a mid TD
babble may need the same treatment, which is not surprising.

Unfortunately I didn't print enough debug info to confirm this with
certainty and it is absolutely unreproducible, I have no idea why it
happened.

