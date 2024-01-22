Return-Path: <linux-usb+bounces-5337-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB857835D95
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jan 2024 10:04:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 507B2B2920F
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jan 2024 09:04:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F1E138DD1;
	Mon, 22 Jan 2024 09:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SglP5bL4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6BD210FD
	for <linux-usb@vger.kernel.org>; Mon, 22 Jan 2024 09:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705914221; cv=none; b=G4iHzDngQyacqclM1hoyF1fEjAARmJlUQJnhxCWW4J8OxF71qECG7iy7Nk5rIh+0r31div8ZzjcoRSDx/tl5f732nIbMGGZTAU+73g6N4KZ6Y+FYSy+8T3cwvaEeiC4jRmOGZJXrNBguUSVi+MPOYfCjvrL+ToouemM2JOlHxFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705914221; c=relaxed/simple;
	bh=YZpKHuyLgIM+ANjwo9NA4zWe2xWSIh092jc0ffvZRO0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kjLH5gOKz8n1LXHHjUdpZcLCJjJRQakaPow1ukqCtEaWpYJ/0iyiWTDlkIF8qwcUBUwDvuCWzfW17cPqudA6w3maZAsFCu0iCA84RUojMoBGfk0w6qdD/Gj6JyXAn3uoA8d9RTgqbFD3E3BmwjOL0lBqNXoipNm/PTuLar6v4qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SglP5bL4; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-55a539d205aso3044157a12.3
        for <linux-usb@vger.kernel.org>; Mon, 22 Jan 2024 01:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705914217; x=1706519017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wKK4HVBv+YMgm9o7ptCCXSsKinNr2yOxYSUjJksAN4E=;
        b=SglP5bL4jwlWR+1Wk8kMtQYhDNwsOhiibekMvMdSd8hedsrbYJFA7IIYn8q6gssn00
         4PyoVB0zfrzeqT2cyHCSGfbmx4PirxXChT0TncN8xZMYdp79EwAduI0vxJbmhLVP0rRL
         UXB62VkuXVpInBJk7ouCp1G/4WHgGi02DdqNVf9R+MUAfMqoSqcmBXVqJA7zSwUOg3sE
         9uew22O3IOyr1AiGDIJ82+Qsy+TjXZRGY37yLu48XuKvqnxzDWKJDkuQJl6gT6lClzrV
         +OTaItw7jl6PAXvu9zrpG/mzal+k5pDgI6iE+DerrF9JtNTQcBBnrFfk9snAIu7IPdJm
         CqTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705914217; x=1706519017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wKK4HVBv+YMgm9o7ptCCXSsKinNr2yOxYSUjJksAN4E=;
        b=Tk1ootXU4ks9WQkM/qJPVFDbhrmiKdKaNxLx6VP/kH+929tDCdPYVyxEAuoMhtlmQz
         KgA4tAg6SA4Tmy96nMyZYBEpnn+O8jLfvBiRj+oerFJ1LZJM/Wqejl9cGHVuLo2kojbH
         vB3ZywG4aHn1/4E4rv/EEAq3lXg4qERLyrClNgp3+5RNUd5dqbku/cRLfB818CjJlJbq
         8uchBjuikK53PnZl4YWI2XK4innqIykGIZ6H0kCWnuFnd0oV7E5LHx3SGxfvjWWewflQ
         99sRG3OQqT03RolS3sss10MmJJkAOd4uoW0rC9gmcSYj3gHrofItNPXTFDkgx6Ci4JYp
         aEdg==
X-Gm-Message-State: AOJu0YwwdG7z8O5lE5gdi+tv3k1i5UcUIPVrrSy26+Cg++BLgYOi2cbK
	Xqbhi4SZ7wV/LgGqZdn2acYRY9Z2O7LhPbFdZOtiKNkCwEgEtzXiOUGG1gBs
X-Google-Smtp-Source: AGHT+IFw5iKw699fUK+yqeJ2gcH1sSLPinsnWrIQh2QXgil6B/91aMOp0pWfPljINHUFQs1wLQhmeg==
X-Received: by 2002:a17:906:c083:b0:a30:8c7e:92e9 with SMTP id f3-20020a170906c08300b00a308c7e92e9mr37160ejz.141.1705914217318;
        Mon, 22 Jan 2024 01:03:37 -0800 (PST)
Received: from foxbook (acgj208.neoplus.adsl.tpnet.pl. [83.9.237.208])
        by smtp.gmail.com with ESMTPSA id t10-20020a170906178a00b00a28ba0c3821sm13100733eje.101.2024.01.22.01.03.36
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 22 Jan 2024 01:03:36 -0800 (PST)
Date: Mon, 22 Jan 2024 10:03:32 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [RTF PATCH v3] xhci: process isoc TD properly when there was an
 error mid TD.
Message-ID: <20240122100332.6341ef1d@foxbook>
In-Reply-To: <20240119225432.78c2d35d@foxbook>
References: <2c2d8711-3d2b-e943-a2a0-75637e725dc3@linux.intel.com>
	<20240119105835.2637358-1-mathias.nyman@linux.intel.com>
	<20240119225432.78c2d35d@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

> Apparently a babble error, and it seems to have generated a "success"
> which the event handler tried to match with the next TD. So a mid TD
> babble may need the same treatment, which is not surprising.

This is now confirmed and fixed here. The change is obvious enough:
        case COMP_ISOCH_BUFFER_OVERRUN:
        case COMP_BABBLE_DETECTED_ERROR:
+               error_mid_td = true;
                frame->status = -EOVERFLOW;
                break;

I don't know yet what COMP_ISOCH_BUFFER_OVERRUN means, but I guess it's
the same story. BTW, error_mid_td is a local variable now and I use the
urb_length_set flag instead, as explained before.

I found that it can be reproduced on the VIA host, with enough tries it
can happen even on a chained TD. NEC doesn't signal these babble errors
but new mid TD event handling should cope with either host.

Debug trace ("interesting" is other than "success" or "short packet"):
[ 4113.376349] xhci_hcd 0000:03:00.0: handle_tx_event interesting ep_trb_dma 132961000 comp_code 3 slot 2 ep 2
[ 4113.376361] xhci_hcd 0000:03:00.0: handle_tx_event first_trb 132961000 last_trb 132961010
[ 4113.376364] xhci_hcd 0000:03:00.0: Error mid isoc TD, wait for final completion event
[ 4113.376366] xhci_hcd 0000:03:00.0: handle_tx_event uninteresting ep_trb_dma 132961010 comp_code 1 slot 2 ep 2
[ 4113.376369] xhci_hcd 0000:03:00.0: handle_tx_event first_trb 132961000 last_trb 132961010
[ 4113.376371] xhci_hcd 0000:03:00.0: Got SUCCESS after mid TD error
[ 4113.376373] xhci_hcd 0000:03:00.0: finish_td comp_code 1 status -75


Thanks,
Michal

