Return-Path: <linux-usb+bounces-12578-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6A793FCFA
	for <lists+linux-usb@lfdr.de>; Mon, 29 Jul 2024 20:01:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A78D4282DCC
	for <lists+linux-usb@lfdr.de>; Mon, 29 Jul 2024 18:01:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F0DC1741C6;
	Mon, 29 Jul 2024 18:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Gi8Xq6OP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCB415FA66
	for <linux-usb@vger.kernel.org>; Mon, 29 Jul 2024 18:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722276089; cv=none; b=EjeQKONh9UGbpOD0Wa91mqstqk36D0XPR3smwUgQRFalAgg8s80MgOyJnbjPg+2e825xgbs927UK9RaG7b1Zk1I7UHXlfdRpW0tl5Or9duRPV5xjhc/4HLu2gwmzH219g2nCvJVwMYqPJH0WHoBOWy6O/yQ9bID/Z46uuKVaKOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722276089; c=relaxed/simple;
	bh=NxPxTGwFiATU9I0paB9I5SPNOKKKTOqx+SBrETwxHTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tyClXoPHGTvuj7+zg/kkKeys/8Km9/nT8k1Xk4sveQ+7zbSJcYtf76yKILGAWFh1W7yd2V+88VPZX9pG4XH9TEvhLq0X3C8ylw+/SRL9V7diUzliIJ6I3jvhIgTzZUHdTBxMSSpMgwXcuLnT3BDgYgCxFJ/v/1FNqjYS9gQ1+MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Gi8Xq6OP; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-44ff50affc5so21031361cf.1
        for <linux-usb@vger.kernel.org>; Mon, 29 Jul 2024 11:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1722276086; x=1722880886; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Nd1WXiUiTtwYxOMtFvVlG67gP5owuM6QDVES/bBhfKI=;
        b=Gi8Xq6OPZ4Y3aMQLojrKDSxIDgSOe3RPI6xt4MjEYVDrVCyhOOoNFouAJLjg3YFO46
         d4lnr1SQGaEbAIWHXtOegwYeJhL4OiWlqqSXBgoU1/AlUODDcR9poUDNNKVF47f8rdqX
         vC0FDp/1JtrnO75hsBrhKp9ITGPIjZzMFx+nlVScvfnwl+OyEEiXsQk9z5dqP8xHPZal
         D89XqyayNSW1Qdk0KPH5jxzjPe1EEjXWhC9RKbwyXG3Xn4VQaYHefeKmn2+L1YXgWaqH
         pUS1BZyH/VIZ78eyd3SQy0e3VyVAoCj/SNG0+pub3v1RGPgyr3N+xazZ7ptk9R76X7vm
         xYFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722276086; x=1722880886;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nd1WXiUiTtwYxOMtFvVlG67gP5owuM6QDVES/bBhfKI=;
        b=BhHtl62rS2nNc7gsj5QAMRFC65HolnGz/fppc4MjxktlY27ayi0oPiKaA2QFETOVhi
         E2NA2lCytXkf/A52AKAABqQlKRA8TTZhR3TlCuKx7dDs6t2O9X2Blq4Pfz82SCFewi1R
         ioYtTHnHIMcC6F37e7rZY9ZBbM06bOpA/QjL1PSshtSe+wGCWhu6fLDeBEfu0KNICqb5
         0mXDcwcs6t0q4+6qoFZPX8w+/Is1lkjQH8F+pFTm/CHZVVeqRSZnGkL+WAJHUIi0vbNq
         GCvJVJKq077ahMrsusAGw57b6MVGxMJ4TS3nLDvQJckXPqjj27+xUADc25/Fo/EENwP4
         DpNg==
X-Forwarded-Encrypted: i=1; AJvYcCUrYIawx78FsSb6lE8viqWskiHBXK99PJTnlhoN9g4FVoPJ5c91feUhfGqjAw1v/gDCIzWQDbQCPXx/vUpN3T6IhHCGqv7+LQdT
X-Gm-Message-State: AOJu0YwgEPJxX/zAds9p5Tk6xeYeZCGG/paXzHhsTXr3czvPx1MQYVLr
	0kOoasosM7q5r6U7NLl4Zm3zuLDXVsELes4c3gnNrQF1lp1mY3uUWDAPF9GMug==
X-Google-Smtp-Source: AGHT+IGVjAt2ihyHs5zn4xEcJd29SKFy9xWmbX66Bk6IjnJc3rfCed+UL/M7vTEtzJwl7uv6mxhVxQ==
X-Received: by 2002:a05:622a:1791:b0:43f:fc16:6b3f with SMTP id d75a77b69052e-45004f1378dmr135514091cf.34.1722276086083;
        Mon, 29 Jul 2024 11:01:26 -0700 (PDT)
Received: from rowland.harvard.edu (iolanthe.rowland.org. [192.131.102.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-44fe8147635sm44235931cf.31.2024.07.29.11.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 11:01:25 -0700 (PDT)
Date: Mon, 29 Jul 2024 14:01:22 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Andrey Konovalov <andreyknvl@gmail.com>
Cc: Marcello Sylvester Bauer <sylv@sylv.io>, andrey.konovalov@linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Vyukov <dvyukov@google.com>,
	Aleksandr Nogikh <nogikh@google.com>,
	Marco Elver <elver@google.com>,
	Alexander Potapenko <glider@google.com>, kasan-dev@googlegroups.com,
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzbot+2388cdaeb6b10f0c13ac@syzkaller.appspotmail.com,
	syzbot+17ca2339e34a1d863aad@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: dummy_hcd: execute hrtimer callback in
 softirq context
Message-ID: <d4ed3fb2-0d59-4376-af12-de4cd2167b18@rowland.harvard.edu>
References: <20240729022316.92219-1-andrey.konovalov@linux.dev>
 <baae33f5602d8bcd38b48cd6ea4617c8e17d8650.camel@sylv.io>
 <CA+fCnZcWvtnTrST3PrORdPwmo0m2rrE+S-hWD74ZU_4RD6mSPA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+fCnZcWvtnTrST3PrORdPwmo0m2rrE+S-hWD74ZU_4RD6mSPA@mail.gmail.com>

On Mon, Jul 29, 2024 at 06:14:30PM +0200, Andrey Konovalov wrote:
> On Mon, Jul 29, 2024 at 10:26 AM Marcello Sylvester Bauer <sylv@sylv.io> wrote:
> >
> > Hi Andrey,
> 
> Hi Marcello,
> 
> > Thanks for investigating and finding the cause of this problem. I have
> > already submitted an identical patch to change the hrtimer to softirq:
> > https://lkml.org/lkml/2024/6/26/969
> 
> Ah, I missed that, that's great!
> 
> > However, your commit messages contain more useful information about the
> > problem at hand. So I'm happy to drop my patch in favor of yours.
> 
> That's very considerate, thank you. I'll leave this up to Greg - I
> don't mind using either patch.
> 
> > Btw, the same problem has also been reported by the intel kernel test
> > robot. So we should add additional tags to mark this patch as the fix.
> >
> >
> > Reported-by: kernel test robot <oliver.sang@intel.com>
> > Closes:
> > https://lore.kernel.org/oe-lkp/202406141323.413a90d2-lkp@intel.com
> > Acked-by: Marcello Sylvester Bauer <sylv@sylv.io>
> 
> Let's also add the syzbot reports mentioned in your patch:
> 
> Reported-by: syzbot+c793a7eca38803212c61@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=c793a7eca38803212c61
> Reported-by: syzbot+1e6e0b916b211bee1bd6@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=1e6e0b916b211bee1bd6
> 
> And I also found one more:
> 
> Reported-by: syzbot+edd9fe0d3a65b14588d5@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=edd9fe0d3a65b14588d5

You need to be careful about claiming that this patch will fix those bug 
reports.  At least one of them (the last one above) still fails with the 
patch applied.  See:

https://lore.kernel.org/linux-usb/ade15714-6aa3-4988-8b45-719fc9d74727@rowland.harvard.edu/

and the following response.

Alan Stern

