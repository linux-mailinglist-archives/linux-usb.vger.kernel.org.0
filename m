Return-Path: <linux-usb+bounces-5131-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF6082FD11
	for <lists+linux-usb@lfdr.de>; Tue, 16 Jan 2024 23:40:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 616A71C2881F
	for <lists+linux-usb@lfdr.de>; Tue, 16 Jan 2024 22:40:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0272E1F617;
	Tue, 16 Jan 2024 22:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c5XylQ3p"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074C81DA50
	for <linux-usb@vger.kernel.org>; Tue, 16 Jan 2024 22:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705443653; cv=none; b=QUEfbf08R2Tgbt39MPiIPO44Czndweh0JYwE6EKVzSb6NBH2lssaCldLpIapoDwSSWmzHXM5fBle3J6SL6soQYRTuOY+cFfFaSO08LbjLwvrEfmBDdmYnjiapUb8pNNRjTTTbpGdRLGqhBk4cJfxnIKyQasVcCYiQkKtVOK9DFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705443653; c=relaxed/simple;
	bh=PV2seVXH1sa7dW+VOcX/clHk6Nix48PnDZsnaaE3sRU=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:Date:
	 From:To:Cc:Subject:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding; b=rjm5DpUqU3N+jxfh5kfZU5b+D2nylVU2uMuXLF1/tiEJNZ6Ilvx2lrVJQnM7XrGIFBSTboTPKWXWVB3PLgXFc6Yva6or1VDSHzqvQcnT2mZqWoMXNzgcPWq1M83NjeRsgRpO4ivKfOm2f8TG40BpS5FEUfnJCZeqpKa9yfMLG2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c5XylQ3p; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a29c4bbb2f4so1070766666b.1
        for <linux-usb@vger.kernel.org>; Tue, 16 Jan 2024 14:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705443650; x=1706048450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C3eqvHDvmgig/1QP6IOCwELcu21uCh8KINnQ4OGAj+Q=;
        b=c5XylQ3pvu+h9nxSf3aRy/3GqvJmLad/b5A8PpUlCB19fz6xJDJUSpq6oNEg7tJq7l
         wgLUSfsDKSxUkwudPBQrdg8BrAD6TtZdVftfXTBncNhOxTfIMcd3VzdKe/N04CkRydoO
         uU+9ITKUdoF+1bDmCAccH782bQQi6Ryfd/7bS1loWfXtab3Qg9ZQQWGILYs8UeuJAEE1
         HUaT0rZfoO8S87tyEPdRIu6RxwxKAJz/hBXA/4Gn1xt3sqH2UpmvhUdZl4AYYu/paf3w
         I++JDl7Q48vrCc2H3kJEvabcdDDPQ/gm9Kw1J3oUC2imWfTkXXd/EiAP/+i/V7YnHOHk
         JN1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705443650; x=1706048450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C3eqvHDvmgig/1QP6IOCwELcu21uCh8KINnQ4OGAj+Q=;
        b=wXmGhT4SPFDq1digHsZwg/yntZbz+FXdmyILq8ucUodMnf5rhJ4dhRp/MVNejvL+hQ
         LqhYjY2yAZUQrx692rJm1tiHi0w6n1z/IoDVZ2liICdEIrANd9ppzhJ2ztNqSNd9hEH+
         bzP0WPz20ICKfgqWz4j26cbYfTyca7QRd1tVcTGFVyZjO2blipjjPiHpwVuJWWILbnQq
         1QwIUai4Q7rGDeqYH+eY4XxUzRI4e08Ki4EPSPnJ0Ib6xuQcmRfLdPOgNUJ//7Xis5xR
         701qF0E79Gvyi78gq2VAVa6M2bsBRRgRN+iFDTuEnf5AT3jhfG2snPrwOPNGQ2TU75SV
         TDPw==
X-Gm-Message-State: AOJu0YyiIojp0QwS9snsVqsGFxAkb7OuhLh7Z5sY4v/QZ7xK0YvNW0vU
	ZEJ0ijvsi61JW1drxaBh9HQ=
X-Google-Smtp-Source: AGHT+IH0X23n6BWpQo3pDb4xn3jiLFuf6ARfmGuC6rsEmpBShP6U4SozmTnCFXl8Pkda4QawFSztVQ==
X-Received: by 2002:a17:906:3193:b0:a2b:a272:9812 with SMTP id 19-20020a170906319300b00a2ba2729812mr3027406ejy.42.1705443650051;
        Tue, 16 Jan 2024 14:20:50 -0800 (PST)
Received: from foxbook (bff170.neoplus.adsl.tpnet.pl. [83.28.43.170])
        by smtp.gmail.com with ESMTPSA id t3-20020a170906608300b00a2c8dfa5c25sm6399134ejj.123.2024.01.16.14.20.49
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 16 Jan 2024 14:20:49 -0800 (PST)
Date: Tue, 16 Jan 2024 23:20:45 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [RFT PATCH] xhci: process isoc TD properly when there was an
 error mid TD.
Message-ID: <20240116232045.76da750b@foxbook>
In-Reply-To: <20240116153618.2527463-1-mathias.nyman@linux.intel.com>
References: <20240115172709.0b6f2bba@foxbook>
	<20240116153618.2527463-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

I applied your patch on v6.7 and it appears to be working. It removes
the disconnection spam and also handles intermittent transmission errors
on UVC without obvious glitches or errors messages, except one xhci_dbg
added to confirm that I'm really hitting this edge case.

Anything else that might be worth testing?


I have a question, though. What happens if there is no next TD because
a mid TD error has occured on the last packet queued by the client? Is
there any mechanism to retire that stuck TD on a NEC host which submits
one mid TD error event and then goes silent?

Would it be possible to retire the TD right after the first failed TRB?
(I imagine difficulties in determining when exactly the host has moved
its internal pointer past the remaining TRBs so they can be reused).


> -			if (!ep->skip ||
> -			    !usb_endpoint_xfer_isoc(&td->urb->ep->desc)) {
> +			if (ep->skip && usb_endpoint_xfer_isoc(&td->urb->ep->desc)) {
I like this. I would suggest another cleanup: the if(!ep_seg && stuf)
right above your change could be pulled inside if(!ep_seg).


> +			 * if there was an error event mid TD then host may not
> +			 * give an event for the last TRB on an isoc TD.
> +			 * This event can be for the next TD, See xHCI 4.9.1.
This seems to suggest that 4.9.1 encourages such behavior, but the
opposite is the case as far as I understand.


> +			if (td->error_mid_td) {
> +				struct xhci_td *td_next = list_next_entry(td, td_list);
This if needs && !list_is_last(&td->td_list, &ep_ring->td_list).

Otherwise a serious bug in the host (maybe in the driver too) tricks
us into grabbing a pointer to ep_ring instead, filling the subsequent
"TRB not part of current TD" message with mystifying garbage numbers.


> +				if (ep_seg) {
> +					/* give back previous TD, start handling new */
Suggested:
> +					xhci_dbg(xhci, "Missing completion event after mid TD error\n");


Thanks,
Michal

