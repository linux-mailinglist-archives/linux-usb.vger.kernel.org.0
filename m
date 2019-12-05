Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88A5F11432B
	for <lists+linux-usb@lfdr.de>; Thu,  5 Dec 2019 16:00:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729489AbfLEPAQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Dec 2019 10:00:16 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:37216 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729187AbfLEPAQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 Dec 2019 10:00:16 -0500
Received: by mail-lj1-f195.google.com with SMTP id u17so3956019lja.4
        for <linux-usb@vger.kernel.org>; Thu, 05 Dec 2019 07:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vincit.fi; s=ticniv;
        h=from:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=m2ryIA8E/x6T4QpaW7eDatipbgVDQ9wxyjJ1kaI8Q8U=;
        b=MXM0qPk5lpDh7BwvAatwYt7HLkSsg8OJH4KDE72nQf+OypMoI5t7eRfSWnSkKSyyLs
         ifQ+E+DWjUcoYj9X2lcMLieKUnbRxqxAr8qc268NjVtRDVJuxPLfwWAXUXQsnk2qAdrT
         q+rWfHkxo3vy+/80X8NkwOa1ADmaE5k5A+YFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:references:in-reply-to:subject:date
         :message-id:mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=m2ryIA8E/x6T4QpaW7eDatipbgVDQ9wxyjJ1kaI8Q8U=;
        b=rCiOhfkg2WOuvhY/hxBj07agh97NPW1jehuHFLFrfUMOQr2c4GLTJ6vCJQTsOadr5R
         HgWEvAOni96aiRmg6AUIUW2914DiRyDwiV0iPauVMh4WHPBUPRRPhDB39qOgvMPzK6iL
         rlO3Z6pVC2KObgT4wU6hg1HC7pvbeN89XxvG6JOOHaZqnaLVICUbBkuZ9owWYLptzzja
         ca0RziQyAI2J4+QIF/k7Cx+HH1Gp8uuUQbk1TdDMTe0ecDCiJLlOG956wYk7WtG5LBt9
         56I4MB9RkaudFofk2m1Y7hbzeoHJfhyq6XrJQmg3kg7FKEFEYiARB+edUwgWHujXZi4r
         uz+g==
X-Gm-Message-State: APjAAAXc0SlO61L5lzA+JCq0egkMXDR3/bk1CGQ4WC+8noGMLq9qzN0n
        /0eUEOwU762Wx+gFnw39r7rMJA==
X-Google-Smtp-Source: APXvYqwIpqBstWLDyvl4MpzGAjJg+7PAkB9SZ96dbyu2TqLTIBbAQrWkrsGj9XSW+a0Hx/jQuGHB2g==
X-Received: by 2002:a2e:b017:: with SMTP id y23mr5632819ljk.229.1575558014246;
        Thu, 05 Dec 2019 07:00:14 -0800 (PST)
Received: from LAPTOPJ4R3A4KE ([213.255.177.137])
        by smtp.gmail.com with ESMTPSA id n19sm5064260lfl.85.2019.12.05.07.00.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Dec 2019 07:00:13 -0800 (PST)
From:   "Erkka Talvitie" <erkka.talvitie@vincit.fi>
To:     "'Alan Stern'" <stern@rowland.harvard.edu>
Cc:     <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
        <claus.baumgartner@med.ge.com>
References: <021d01d5ab57$c2f1ab20$48d50160$@vincit.fi> <Pine.LNX.4.44L0.1912050929350.14919-100000@netrider.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1912050929350.14919-100000@netrider.rowland.org>
Subject: RE: [RFCv1 1/1] USB: EHCI: Do not return -EPIPE when hub is disconnected
Date:   Thu, 5 Dec 2019 17:00:11 +0200
Message-ID: <022001d5ab7c$b1e27380$15a75a80$@vincit.fi>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJWW2imBYfVkNVm2yXx/HSEv8A48aaqPkqA
Content-Language: fi
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> -----Original Message-----
> From: Alan Stern <stern@rowland.harvard.edu>
> Sent: torstai 5. joulukuuta 2019 16.38
> To: Erkka Talvitie <erkka.talvitie@vincit.fi>
> Cc: gregkh@linuxfoundation.org; linux-usb@vger.kernel.org;
> claus.baumgartner@med.ge.com
> Subject: RE: [RFCv1 1/1] USB: EHCI: Do not return -EPIPE when hub is
> disconnected
> 
> On Thu, 5 Dec 2019, Erkka Talvitie wrote:
> 
> > I tested this change and the issue did not reproduce.
> >
> > However when I was writing the comments for the patch I started to
> > think what happens in this following scenario:
> >
> > The PID Code is IN.
> >
> > 1. First there will be XACT, the CERR is decremented, let's say from 3
> > to 2 and the host controller executes a retry.
> > 2. On this next try there will happen the condition mentioned in the
> > Table
> > 4-13 of the EHCI specification so that the MMF is set and the queue is
> > halted (because it is IN).
> > 3. To my understanding now the execution enters to this first stall
> > check if, as CERR is > 0 and CERR < EHCI_TUNE_CERR.
> > 4. The -EPIPE (stall) is returned when actually the queue was halted
> > due to MMF - not stall - and the -EPROTO should be returned.
> >
> > Is my logic correct or am I missing something?
> 
> The same thought had occurred to me.
> 
> > If you agree with me then I would like to present you a bit more bold
> > (in a sense of amount of refactoring) RFC. In high level this another
> > RFC separates 1. error check and 2. stall check. For me this approach
> > is a bit easier to understand from the code. Or then please  propose
> > another solution.
> 
> I was going to suggest: Just check for MMF and PID == IN before checking
for
> STALL.  Everything else can remain the way it is.

Ok, just to double check:

I take the existing driver code (I will not apply the earlier RFC on top of
that) and apply one more check before the original stall check (that is):
} else if (QTD_CERR(token)) {

The check that I will add is checking MMF bit && PID == IN, and this check
comes right after the babble check, right?

Good, seems like a simple change. Yet I still prefer to test the change.
Unfortunately that goes to the next week as we have a national holiday
tomorrow. 
I will get back to you most likely on Monday.

> 
> Alan Stern
> 
Erkka Talvitie

