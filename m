Return-Path: <linux-usb+bounces-3017-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EF47F134A
	for <lists+linux-usb@lfdr.de>; Mon, 20 Nov 2023 13:30:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C0BFEB21401
	for <lists+linux-usb@lfdr.de>; Mon, 20 Nov 2023 12:30:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A0781A5B9;
	Mon, 20 Nov 2023 12:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="yWQjUq4+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B035E9
	for <linux-usb@vger.kernel.org>; Mon, 20 Nov 2023 04:29:45 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-32d81864e3fso2727318f8f.2
        for <linux-usb@vger.kernel.org>; Mon, 20 Nov 2023 04:29:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1700483383; x=1701088183; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yLBnztJzQ5ZjTU+rkeAICOeEEaHMlSGy5VYix9QDGHU=;
        b=yWQjUq4+EB0cQjc3/vzDuASAjE28r76Cte0ptVH3PO2jSzlg46qMk1D8MwpOeG5l5r
         6U3ZUcWIHML4om8vP/VNtlzYak080dBbOg0MMzsqtmnipbj5eZILBfCpslU63Lf5bNTq
         9s2FHpgWdV51TJGC/2lvOwozh5cvXNjeejqGI/6QnsIsiYj92NV8OzA23TtwS+HDPQt8
         fgxJEl+y7jB3TKimyWZIH3XN1L8qMN5eep6yS8oyxBC+S84Sq9k2EXpzGUZaUjdB9/yk
         0bu2D9M3C+ZPP7aL5s0jhjqZYn8HdOO46mzu6DyR+uJxyb5Rw8ntzTGD9xGYvvpbFQvn
         uSTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700483383; x=1701088183;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yLBnztJzQ5ZjTU+rkeAICOeEEaHMlSGy5VYix9QDGHU=;
        b=xLzL8ukN9VDpWsN9x/ar0lXcGKLONTwBCRRRVLSIccptGtz3nbvOTsI6wjxkxCL3it
         HswHkbxMAVli5L2VH1XLQ0yAIP+s2lhVmdAp4C2768wxEVlqMzhiGzcDk307j/88ETeH
         B8PAMgmJNZJq7i01SgRI5+wznHZNvdkSQcdJNHGcvJqb0Vqh22OjNzbV76OwyqsUeN7Z
         +NBz1qBoval0FEgxy5F0O+oVKUe0dNENYwg21TRuhw7ovGF8EergXsYGjWjSQQSUTAqH
         TOAQlmr0sNumTa1yftNeawL5PA2txfkILjKqpBDMclLUlZ11pWYfBz1lHR9OiyDnpSty
         wM3Q==
X-Gm-Message-State: AOJu0YzAeL2JFV9AQ/1IRYl7hA1w3PWgm8dyMGF7QMH1hTsYP/4lp+fC
	hhLqc/qVX/Vbh75c0Vrbkar2WQ==
X-Google-Smtp-Source: AGHT+IGcH5ws8R7gho0xFj6diMMOkXuGzWwmhw29g4OVRwtAvArZiklr60laZWr/59U2F1dra8ebTw==
X-Received: by 2002:a5d:64a5:0:b0:324:84cd:5e67 with SMTP id m5-20020a5d64a5000000b0032484cd5e67mr5631206wrp.6.1700483383381;
        Mon, 20 Nov 2023 04:29:43 -0800 (PST)
Received: from Red ([2a01:cb1d:3d5:a100:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id s6-20020adfdb06000000b0032da49e18fasm11101989wri.23.2023.11.20.04.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 04:29:42 -0800 (PST)
Date: Mon, 20 Nov 2023 13:29:41 +0100
From: Corentin LABBE <clabbe@baylibre.com>
To: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
Cc: gregkh@linuxfoundation.org, johan@kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	david@ixit.cz
Subject: Re: [PATCH v6 0/2] usb: serial: add support for CH348
Message-ID: <ZVtRNZmCMImCT9sN@Red>
References: <20230628133834.1527941-1-clabbe@baylibre.com>
 <2595072.9XhBIDAVAK@archbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2595072.9XhBIDAVAK@archbook>

Le Wed, Aug 30, 2023 at 07:43:03PM +0200, Nicolas Frattaroli a écrit :
> On Mittwoch, 28. Juni 2023 15:38:32 CEST Corentin Labbe wrote:
> > Hello
> > 
> > The CH348 is an octo serial to USB adapter.
> > The following patch adds a driver for supporting it.
> > Since there is no public datasheet, unfortunatly it remains some magic values.
> > 
> > It was tested with a large range of baud from 1200 to 1500000 and used with
> > success in one of our kernel CI testlab.
> > 
> > Regards
> > 
> > [...]
> 
> Hello,
> 
> thank you for your work on this. I recently made myself a CH348
> board and used this patchset with a small test application[1]
> to see how it performs. Specifically, I ran this on an RK3566
> single board computer, connecting one serial adapter to the
> other, with the test as follows:
> 
>  ./serialtest /dev/ttyUSB0 9600 # UART0 of 1st CH348 board
>  ./serialtest /dev/ttyUSB8 9600 # UART0 of 2nd CH348 board
> 
> One problem I've noticed is that writes to the tty fd never
> seem to block. On two CH340 adapters I have, they do seem to
> block, whereas here, you can see from the statistics at the
> end that magnitudes more bytes were written than read, with
> seemingly most of them being discarded. From my reading of
> the termios parameters I set, this shouldn't be the case,
> right?
> 
> You can see from the error percentage that it gets less
> bad as you increase the serial baudrate; I've tested up
> to 6 mbaud like this. I assume that's because less written
> bytes get discarded.
> 
> Any ideas on whether I'm relying on weird driver behaviour
> with the blocking here or if this driver actually has a
> defect whereby it never signals to userspace that less
> bytes were written than have been submitted?
> 
> Kind regards,
> Nicolas Frattaroli
> 
> [1]: https://github.com/CounterPillow/serialtest
> 

Hello

Sorry for the very long delay of the answer.
I have reproduced the problem on my board.
My reproducer is https://github.com/montjoie/lava-tests/blob/master/test2a2.py

This problem seems to be here since the v1 of my patchset.
The vendor driver seems to work so it is not an hardware problem.

I have no clue at the moment, it is hard to diff with vendor driver since it create tty directly and do not use usbserial.

Regards

