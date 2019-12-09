Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46EF0116A4E
	for <lists+linux-usb@lfdr.de>; Mon,  9 Dec 2019 10:57:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727202AbfLIJ5o (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Dec 2019 04:57:44 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:39650 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727113AbfLIJ5o (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Dec 2019 04:57:44 -0500
Received: by mail-lf1-f68.google.com with SMTP id c9so9682764lfi.6
        for <linux-usb@vger.kernel.org>; Mon, 09 Dec 2019 01:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vincit.fi; s=ticniv;
        h=from:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=mg28/52mMYOa2uKx0WHB1toSNsjd9OF2uhKQYSOnkVQ=;
        b=NuClSs2D1++lC6WCtR/o7mjPnTWNGZCCQFz+JdCw60v9i+IUtLa7gXWslvWxBmGdeS
         HUW3f4Gm5LNJGHpf9r4vXlLRbRl9+nEvuKHDknvy5pyzLzXSDCdkDbXQctjesB6NPswO
         mxv4BxhBb9K+R2/K0JdHP2pDlUrMc86krKpBc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:references:in-reply-to:subject:date
         :message-id:mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=mg28/52mMYOa2uKx0WHB1toSNsjd9OF2uhKQYSOnkVQ=;
        b=Lwz5CCBMxDWQpTArqET+HLk/3Akyk09I3hJulEXqQRX7xeQ3WQveqvupXbhkOUfm9Q
         OqH0Cecv0Nss9HmQHk5cX8AbcRT6nUjm7aLya+9rR85WR73eNNEBcrqLQHWP1FoIgtwk
         TaoJboqyeqHttKVZEcnzw4e/jT5s5yIHY7J1KomChbxjDbbFb0F+gVZu+9hdh+bMqozH
         3JMMDBH9ga5Eg3JywMdzZU6+ev+/j0WVYlV52xk7UIiLTEOtEwaKsErE/tgW4CgavSa5
         eDt+3io3oFUOaIBIzVpJDOAGa5IwtDVHdQqpBZcgQboxG9aZY97QBgzPTWhBw5XZDmCW
         f6cQ==
X-Gm-Message-State: APjAAAUX/3rbYxgDgk0tIVa/PLMupJaBxo4NrwufClsP4zJ/qUifxi5d
        VK5/5EeF3bOhHXInrkVoE22Igl/rNEE=
X-Google-Smtp-Source: APXvYqw/hll16Ket+BaPvda1Kk0W9GuQ+KOdBKpwBKWZOlewqd2/nLginMyuYK1D2VF8CreSBXmtig==
X-Received: by 2002:a19:ac45:: with SMTP id r5mr14865240lfc.131.1575885461807;
        Mon, 09 Dec 2019 01:57:41 -0800 (PST)
Received: from LAPTOPJ4R3A4KE ([213.255.177.137])
        by smtp.gmail.com with ESMTPSA id d24sm10614591lja.82.2019.12.09.01.57.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Dec 2019 01:57:40 -0800 (PST)
From:   "Erkka Talvitie" <erkka.talvitie@vincit.fi>
To:     "'Alan Stern'" <stern@rowland.harvard.edu>
Cc:     <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
        <claus.baumgartner@med.ge.com>
References: <021d01d5ab57$c2f1ab20$48d50160$@vincit.fi> <Pine.LNX.4.44L0.1912050929350.14919-100000@netrider.rowland.org> <022001d5ab7c$b1e27380$15a75a80$@vincit.fi>
In-Reply-To: <022001d5ab7c$b1e27380$15a75a80$@vincit.fi>
Subject: RE: [RFCv1 1/1] USB: EHCI: Do not return -EPIPE when hub is disconnected
Date:   Mon, 9 Dec 2019 11:57:34 +0200
Message-ID: <023701d5ae77$14ec9d50$3ec5d7f0$@vincit.fi>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQH4AYzE91VgTdVGdTtRvjAH4Jg/hAJWW2imAroTpnWnRGba0A==
Content-Language: fi
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> -----Original Message-----
> From: Erkka Talvitie <erkka.talvitie@vincit.fi>
> Sent: torstai 5. joulukuuta 2019 17.00
> To: 'Alan Stern' <stern@rowland.harvard.edu>
> Cc: gregkh@linuxfoundation.org; linux-usb@vger.kernel.org;
> claus.baumgartner@med.ge.com
> Subject: RE: [RFCv1 1/1] USB: EHCI: Do not return -EPIPE when hub is
> disconnected
> 
> 
> 
> > -----Original Message-----
> > From: Alan Stern <stern@rowland.harvard.edu>
> > Sent: torstai 5. joulukuuta 2019 16.38
> > To: Erkka Talvitie <erkka.talvitie@vincit.fi>
> > Cc: gregkh@linuxfoundation.org; linux-usb@vger.kernel.org;
> > claus.baumgartner@med.ge.com
> > Subject: RE: [RFCv1 1/1] USB: EHCI: Do not return -EPIPE when hub is
> > disconnected
> >
> > On Thu, 5 Dec 2019, Erkka Talvitie wrote:
> >
> > > I tested this change and the issue did not reproduce.
> > >
> > > However when I was writing the comments for the patch I started to
> > > think what happens in this following scenario:
> > >
> > > The PID Code is IN.
> > >
> > > 1. First there will be XACT, the CERR is decremented, let's say from
> > > 3 to 2 and the host controller executes a retry.
> > > 2. On this next try there will happen the condition mentioned in the
> > > Table
> > > 4-13 of the EHCI specification so that the MMF is set and the queue
> > > is halted (because it is IN).
> > > 3. To my understanding now the execution enters to this first stall
> > > check if, as CERR is > 0 and CERR < EHCI_TUNE_CERR.
> > > 4. The -EPIPE (stall) is returned when actually the queue was halted
> > > due to MMF - not stall - and the -EPROTO should be returned.
> > >
> > > Is my logic correct or am I missing something?
> >
> > The same thought had occurred to me.
> >
> > > If you agree with me then I would like to present you a bit more
> > > bold (in a sense of amount of refactoring) RFC. In high level this
> > > another RFC separates 1. error check and 2. stall check. For me this
> > > approach is a bit easier to understand from the code. Or then please
> > > propose another solution.
> >
> > I was going to suggest: Just check for MMF and PID == IN before
> > checking
> for
> > STALL.  Everything else can remain the way it is.
> 
> Ok, just to double check:
> 
> I take the existing driver code (I will not apply the earlier RFC on top
of
> that) and apply one more check before the original stall check (that is):
> } else if (QTD_CERR(token)) {
> 
> The check that I will add is checking MMF bit && PID == IN, and this check
> comes right after the babble check, right?
> 
> Good, seems like a simple change. Yet I still prefer to test the change.
> Unfortunately that goes to the next week as we have a national holiday
> tomorrow.
> I will get back to you most likely on Monday.

I tested this change and it removes the error messages from the output.

> 
> >
> > Alan Stern
> >
> Erkka Talvitie

Erkka Talvitie

