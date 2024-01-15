Return-Path: <linux-usb+bounces-5074-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B33BB82DD94
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jan 2024 17:27:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C4E1E1C21D65
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jan 2024 16:27:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 814E317BB4;
	Mon, 15 Jan 2024 16:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GG0hKanx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901AD17BA7
	for <linux-usb@vger.kernel.org>; Mon, 15 Jan 2024 16:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-50e80d40a41so11343366e87.1
        for <linux-usb@vger.kernel.org>; Mon, 15 Jan 2024 08:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705336034; x=1705940834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q7P2P6rw7pjqUoDNxLufG25Zn1dUP+6U5qxZYzyS080=;
        b=GG0hKanxn+Knu3qiZ7LoAPWkIVytDRVQNTCzqPe1EpMq0nsutawpc1O1mZSebzT2U6
         g6sx9nliKCvNe8VPke/Y1tseLr/mrlJPOHHn/hMuzzMcw/43HGFw476pwgjqiPbcMWB6
         VMOFRTxkzgGyGrCLM9XSTyGFRMYgIHChD+NS9hv5AXYi1lhT37Q3PHLqAW2+SnNLMmlV
         xDaOuZ8yuEd386vF/zd7W0arpXE+iFab5rZzrSU1WbzHeRua1qGYmeVXhLlBxJtMCXvq
         PqFWYKxdig807eElx9mwYb8Xb8yxv6bLfk5IlpIkyg79PI468kyk5RarDO/jKpraag7Q
         Walg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705336034; x=1705940834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q7P2P6rw7pjqUoDNxLufG25Zn1dUP+6U5qxZYzyS080=;
        b=aaklSijIdZIDZaXfmjdxJ/QGROZo8RnpeuOT3WeIbi3H+hlssBFqvIIoWHtfXRHsK5
         08h1aop6A/wVTYwS63KAiJL9eGuyTMVIvavgOQJJc4eahqCoaGbHxdbL7Hj3++FViiSb
         I+xhUqbIK2AUVJ2UugX8i2k5sBOTmWwzov20JG+gfvZpPn0mLTNwm7c1ZQ9/g9ioOdtV
         bNCU2T6WZipgGDw4m2Ih2l4DBpQXrh+KwP0yawBcjyLZc+8WT3XVIT2PyL6DV0TFQ/Kk
         wGtglCV5jrWsQJ0uc37AA4J4ppA7U9w2jtrWsfMq6fkzwlbjpTF/gdmxfl1q5IEmBsOT
         DYHg==
X-Gm-Message-State: AOJu0YwbqZEqxyr/zA39JBwXrz7n+Bk48LI7yuNW1RhyT/2ruQJHMav/
	nETxXROqFnRmjb/HL2FrfsY=
X-Google-Smtp-Source: AGHT+IGkgkg0Lrv1sjn83zTPzIIWJmyQ3Q9G/lVpPhu4iKMvBZvSvsTW/q9EpM4ZGzYoOnwwsnLDuA==
X-Received: by 2002:a05:6512:12c4:b0:50e:ebd3:3517 with SMTP id p4-20020a05651212c400b0050eebd33517mr2446444lfg.39.1705336034277;
        Mon, 15 Jan 2024 08:27:14 -0800 (PST)
Received: from foxbook (bff170.neoplus.adsl.tpnet.pl. [83.28.43.170])
        by smtp.gmail.com with ESMTPSA id t16-20020a05640203d000b00554d57621eesm5615849edw.90.2024.01.15.08.27.13
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 15 Jan 2024 08:27:13 -0800 (PST)
Date: Mon, 15 Jan 2024 17:27:09 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>
Subject: Re: "Transfer event TRB DMA ptr not part of current TD" spam after
 USB disconnection
Message-ID: <20240115172709.0b6f2bba@foxbook>
In-Reply-To: <a4573246-7047-dba3-efbf-3f88a952e322@linux.intel.com>
References: <20240112235205.1259f60c@foxbook>
	<20240113214757.3f658913@foxbook>
	<20240114150647.18a46131@foxbook>
	<a4573246-7047-dba3-efbf-3f88a952e322@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Thanks for looking at this.

I recognize that the situation is tricky and simply reverting
d104d0152a97f is not a permanent option if other hosts need it.

Yes, I have set up a test machine to debug this and I can use it to
try potential solutions. If you have your own NEC uPD720200 specimen
you could reproduce it yourself, all it takes is unplugging any UVC
isochronous camera while recording with any software. This driver
queues plenty of buffers, so chances of hitting a split TD are good.


Regarding the spec, section 4.10.2 only states that an error shall
generate _a_ Transfer Event on current TRB regargdless of its flags
and that an error may occur on any TRB of a TD.

I think more relevant and useful is the final note in section 4.9.1:

> If an error is detected while processing a multi-TRB TD, the xHC shall
> generate a Transfer Event for the TRB that the error was detected on
> with the appropriate error Condition Code, then may advance to the next
> TD. If in the process of advancing to the next TD, a Transfer TRB is
> encountered with its IOC flag set, then the Condition Code of the
> Transfer Event generated for that Transfer TRB should be Success,
> because there was no error actually associated with the TRB that
> generated the Event. However, an xHC implementation may redundantly 
> assert the original error Condition Code.

To me it looks like the host is expected to skip the remaining TRBs
(section 4.10.2 also mentions continuing to the next ESIT on isoch EPs),
but subsequent text seems to assume that IOC flags will nevertheless be
honored by the xHC (NEC fails here). It is noteworthy that the host is
encouraged to respond "success", so the driver must remember earlier
errors anyway while waiting till the end of the TD.


Regards,
Michal

