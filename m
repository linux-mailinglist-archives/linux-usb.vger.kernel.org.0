Return-Path: <linux-usb+bounces-23360-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA0AA97F34
	for <lists+linux-usb@lfdr.de>; Wed, 23 Apr 2025 08:31:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56CC63BB70F
	for <lists+linux-usb@lfdr.de>; Wed, 23 Apr 2025 06:30:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DD601DE4E7;
	Wed, 23 Apr 2025 06:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b="Ejyr6aE0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6469A13C3F6
	for <linux-usb@vger.kernel.org>; Wed, 23 Apr 2025 06:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.149.199.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745389864; cv=none; b=gmKTIq0Yvg8yBBBjnLkB/jZX51IGAIjKhWzVsLzDY6DyQkpO6igMy1rqhSmqOwuYOyneJpruyOEwy+ukEzzBL3i+fD3TMbZ5bwpfUA+zI9FLYgkSxawoGK69xygvlb78/4tlnX5501sTVXOGQnN8xOj07OSIILxyaHTQhDElsS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745389864; c=relaxed/simple;
	bh=A/vPUqVhhl8PwVDrB4H+TWVYAvG7AiTYpf7XAQkbNUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=noIkAb6zAtSNEEwx9McAe4qnZlwEQTSMXAi8JQEuUHS6gZNDJEDdU5obKCQzGdWdzqaLjNh8LY/eZNTl8tlGSItZ1mr3RwpEemeZT+v9GwcgHcp8a1KFsz5rEAR3Q4Yx51y7sirus4xR23kGIXqd0wnOlbAkraInUqD1ErwRfhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru; spf=pass smtp.mailfrom=ispras.ru; dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b=Ejyr6aE0; arc=none smtp.client-ip=83.149.199.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ispras.ru
Received: from localhost (unknown [10.10.165.7])
	by mail.ispras.ru (Postfix) with ESMTPSA id ACFE25275407;
	Wed, 23 Apr 2025 06:30:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru ACFE25275407
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1745389848;
	bh=WRlaGAiE67RbUfRrqw8QVY0xVjkAHaAAP8HjVTImFqM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ejyr6aE0tC9GxKHZxnhlHndt80xI0oNt7E9G8CytHPKYFKOe5wju5fW0/qxzMpebJ
	 JBhX/SqfMpB1dUReETD9vrkrjTPhOEvOR9RX68ooqGYb0dlz5FWYIvFIm87P+usQU7
	 ef9zZB3e+laPPnHjMDY0cxxkatHPK3BqW5aGtb3s=
Date: Wed, 23 Apr 2025 09:30:48 +0300
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: "Alexey V. Vissarionov" <gremlin@altlinux.org>
Cc: Rui Miguel Silva <rui.silva@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, lvc-project@linuxtesting.org
Subject: Re: [PATCH] usb: isp1760: increase buffer size to avoid overflow
Message-ID: <rdsyrsjl67rjhkuatkaggnrfcruvzcxlwnfb6jgqgh5ninlnmj@hy2ofl7jlhei>
References: <20250422230000.GA857@altlinux.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250422230000.GA857@altlinux.org>

On Wed, 23. Apr 02:00, Alexey V. Vissarionov wrote:
> isp1760_field_set() may access the udc->fields array beyond the size
> of DC_FIELD_MAX up to HC_FIELD_MAX, which is (now) bigger. Increase
> the buffer size to max(DC_FIELD_MAX,HC_FIELD_MAX) to avoid possible
> overflow.

Where exactly does the problem manifest? There is no comprehensible bug
description here from you..

Though I guess isp1760_set_pullup() call site is concerned?

> @@ -267,6 +267,8 @@ enum isp176x_device_controller_fields {
>  	DC_FIELD_MAX,
>  };
>  
> +#define	FIELD_MAX	(DC_FIELD_MAX>HC_FIELD_MAX?DC_FIELD_MAX:HC_FIELD_MAX)
> +

Please make sure to run your changes through checkpatch.pl and the
compiler first. They are both not happy at the moment.


In file included from drivers/usb/isp1760/isp1760-hcd.h:8,
                 from drivers/usb/isp1760/isp1760-core.h:21,
                 from drivers/usb/isp1760/isp1760-core.c:24:
drivers/usb/isp1760/isp1760-regs.h:270:9: warning: ‘FIELD_MAX’ redefined
  270 | #define FIELD_MAX       (DC_FIELD_MAX>HC_FIELD_MAX?DC_FIELD_MAX:HC_FIELD_MAX)
      |         ^~~~~~~~~
In file included from ./include/linux/fortify-string.h:5,
                 from ./include/linux/string.h:392,
                 from ./include/linux/bitmap.h:13,
                 from ./include/linux/cpumask.h:12,
                 from ./arch/x86/include/asm/tlbbatch.h:5,
                 from ./include/linux/mm_types_task.h:17,
                 from ./include/linux/sched.h:38,
                 from ./include/linux/delay.h:13,
                 from drivers/usb/isp1760/isp1760-core.c:15:
./include/linux/bitfield.h:86:9: note: this is the location of the previous definition
   86 | #define FIELD_MAX(_mask)                                                \
      |         ^~~~~~~~~
drivers/usb/isp1760/isp1760-regs.h:270:38: warning: comparison between ‘enum isp176x_device_controller_fields’ and ‘enum isp176x_host_controller_fields’ [-Wenum-compare]
  270 | #define FIELD_MAX       (DC_FIELD_MAX>HC_FIELD_MAX?DC_FIELD_MAX:HC_FIELD_MAX)
      |                                      ^
drivers/usb/isp1760/isp1760-hcd.h:53:41: note: in expansion of macro ‘FIELD_MAX’
   53 |         struct regmap_field     *fields[FIELD_MAX];
      |                                         ^~~~~~~~~
drivers/usb/isp1760/isp1760-regs.h:270:38: warning: comparison between ‘enum isp176x_device_controller_fields’ and ‘enum isp176x_host_controller_fields’ [-Wenum-compare]
  270 | #define FIELD_MAX       (DC_FIELD_MAX>HC_FIELD_MAX?DC_FIELD_MAX:HC_FIELD_MAX)
      |                                      ^
drivers/usb/isp1760/isp1760-udc.h:72:37: note: in expansion of macro ‘FIELD_MAX’
   72 |         struct regmap_field *fields[FIELD_MAX];
      |                                     ^~~~~~~~~


Thanks!

