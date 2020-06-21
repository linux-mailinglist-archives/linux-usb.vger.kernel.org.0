Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A43C2202AE9
	for <lists+linux-usb@lfdr.de>; Sun, 21 Jun 2020 15:58:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730106AbgFUN6m (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 21 Jun 2020 09:58:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:53602 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729862AbgFUN6m (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 21 Jun 2020 09:58:42 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E735F2491C;
        Sun, 21 Jun 2020 13:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592747921;
        bh=UzG1zBX7PSAou4ha8WZGGCnZ48hLxjyPgXpFr/X3OFE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZS1QS85tlYPKDHOUnXiMCW0T6kAHnTnGl5o/20KVIof7UiSYeE9tmbNqsRYbgCtFY
         tmFk/3mx5d8R/oBA3g09eeSEql8lsU1svSQc9pti27Zkc5Y09pKEDgaTVdgMjAUwmv
         G24tQmY7tq7rfxW9yVAGh4uFoogRx5cTfCC2ZdoM=
Date:   Sun, 21 Jun 2020 15:58:38 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Jerry <Jerry@jrr.cz>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/1] usbserial: cp210x - icount support for parity error
 checking
Message-ID: <20200621135838.GA125568@kroah.com>
References: <b4cd2557-9a61-5ccd-32ad-48b0c68bef6b@jrr.cz>
 <20200621085816.GB95977@kroah.com>
 <03712b5a-ecb6-ae42-ff8e-8d5d6f2ed918@jrr.cz>
 <20200621095509.GA120230@kroah.com>
 <470484c8-7afc-c593-5ca9-cdb97dba39e1@jrr.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <470484c8-7afc-c593-5ca9-cdb97dba39e1@jrr.cz>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Jun 21, 2020 at 12:34:52PM +0200, Jerry wrote:
> Greg Kroah-Hartman wrote on 6/21/20 11:55 AM:
> > > I read it, but still not sure what exactly was wrong? Yes, I wrapped lines
> > > of description to 80 colums and now I noticed that only 75 columns is
> > > allowed but I doubt that it is all?
> > That is one thing, but also the "This patch..." should not be in a
> > changelog, right?  Look at the other changes sent to the list for
> > examples of how to do this.
> Yes, I looked at another messages here and there are a lot of things which I
> don't understand. For example two dash -- marker at the end (bellow patch)
> with some strange number (2.7.4). I didn't find anything about that in
> documentation.

That is the git version number, and you can ignore it.

> And documentation request diff -up
> https://www.kernel.org/doc/html/v4.17/process/submitting-patches.html#diff-up
> but patches here use another settings because diff -up never give me line
> like
> index 86638c1..f1b46b5 100644
> before file names but put me file date and time next to filename. So what
> version of diff should I use? I have diff (GNU diffutils) 3.7

git creates that, if you use it for creating a diff.  If you want to use
diff "by hand", you can do that too, I was not objecting to that at all.

The only problems I found was in your changelog text, and your email
header.

> > > > > Signed-off-by: Jaromir Skorpil <Jerry@jrr.cz>
> > > > This does not match your From: line :(
> > > I supposed that only mail address in From line matter?
> > > I understand that real name is mandatory only for Signed-off-by field?
> > It has to match the From: line of your email to ensure that this really
> > is the same person.
> Really?
> I looked at another message as you advised and it seems that even YOUR name
> often changes?
> https://marc.info/?l=linux-usb&m=159257306831535
> https://marc.info/?l=linux-usb&m=159256948030250

Short name vs. "real name" doesn't matter much when sending email text
responses, but it does when sending patches, as you are making a legal
agreement about that signed-off-by text.  So it has to be the same,
otherwise I can not take your patch.

> Why is a name so important when you can't verify it? Typing the same text
> twice doesn't prove anything. In fact my real name can't be written in ascii
> because of diacritics marks and I doubt that it will work here correctly if
> I use unicode...

Please use unicode (well utf-8 if possible), I'm all for that, there is
no requirement to use ascii only for your name in patches.  I wish more
people would do that when needed, as it's only fair to them to be able
to properly represent their names and not have to change them somehow.

thanks,

greg k-h
