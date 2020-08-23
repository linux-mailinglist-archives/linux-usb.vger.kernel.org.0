Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02C9624EF23
	for <lists+linux-usb@lfdr.de>; Sun, 23 Aug 2020 20:08:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725885AbgHWSIl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 23 Aug 2020 14:08:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725867AbgHWSIl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 23 Aug 2020 14:08:41 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19BFEC061573
        for <linux-usb@vger.kernel.org>; Sun, 23 Aug 2020 11:08:41 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id g75so6191824wme.4
        for <linux-usb@vger.kernel.org>; Sun, 23 Aug 2020 11:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7XcXsXlpUkjM4Wk7OLSKms1LqXP8CDgaRqJOb5XQ5iI=;
        b=R4Pi7iC9gaKU5YxpPrYXNtT/h1lFhbKGKRv2xoNkjXTPnaxlePLw7fu1QHeKZP1X9B
         zR24pGoybzw6/lnw0GfSdt83hL9v4CvIAm0Ht/ttCF09q+Et2H7Ks4znkKLBKaDkAI8C
         U+c1lsPpOWmJ0wXc4C+q2ZBLGmuDQUmT2aCTBmWPXtHHrXbrMc0xXdPD55SQCfUPtOUG
         a5vJbNPlWwO1qOVIqarusrwBUoXOVGL6lEGR+xFV7+jcyuuk9SLpszkNditpzweKoJDM
         O494QjiKGHNxJAGOmHVCbrJjtiVSbkLhkG1FZMk8p+vMJLHYgt6BTSww7pJcPELB0ysT
         XFTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7XcXsXlpUkjM4Wk7OLSKms1LqXP8CDgaRqJOb5XQ5iI=;
        b=TFaQ/imKOo4EJd7I9ntitvik6crJRgQcMdHS6bUtrhRNUsbTCqZ+yM0yN4Y8oCDqCc
         q98xGWVxsC5Ivk7TBxPhFVuj5J8E+emanVxsPUl4Eg6wWO3ay+hZUkyQDAMo9jQbQctK
         dlmJwnUWhtuxLhm+UJ0SOrAt4NMHg2dFpv1HyALkssvXQtTcGj5f5wEsYf9I8SIxdBWM
         buarcNTps76hqaLnkvYxLpoYKSR4niXt20qtQczVhnLf5He2eXL5x6hcuqngoSqzHTJS
         Fl4qWFJ7SYn1oMKOQlrT0ZME8CGaHZLSA295XskYuSTpdYB6ijA/b4Torbm7xE6XvggU
         830g==
X-Gm-Message-State: AOAM533E7kkY7f8HZA+csfrQ87TBtbL2zSK6mEmnYbKFpWDOexzPpShl
        OV3wfLelddM4QntInqnUBuHJ/QL8rivpKw==
X-Google-Smtp-Source: ABdhPJwxp+0ERKR2D0q00VQg855+UUmmX+0xLd2WrcJMEVQiD2BkpzXwEtFxUS/q5oOC1Y4bQlG9Hg==
X-Received: by 2002:a05:600c:21d6:: with SMTP id x22mr2178926wmj.112.1598206119790;
        Sun, 23 Aug 2020 11:08:39 -0700 (PDT)
Received: from Susan (91-164-97-136.subs.proxad.net. [91.164.97.136])
        by smtp.gmail.com with ESMTPSA id a8sm5062187wrh.86.2020.08.23.11.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2020 11:08:38 -0700 (PDT)
Date:   Sun, 23 Aug 2020 20:08:37 +0200
From:   Cyril Roelandt <tipecaml@gmail.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     USB list <linux-usb@vger.kernel.org>, sellis@redhat.com,
        pachoramos@gmail.com, labbott@fedoraproject.org,
        gregkh@linuxfoundation.org, javhera@gmx.com, brice.goglin@gmail.com
Subject: Re: [BUG] Regression in Linux 5.4.17 for JMicron JMS566 enclosure
Message-ID: <20200823180837.GA3448@Susan>
References: <Pine.LNX.4.44L0.2004191144550.4266-100000@netrider.rowland.org>
 <20200421030137.GA2492@Susan>
 <20200815001829.GA2786@Susan>
 <20200815021929.GC52242@rowland.harvard.edu>
 <20200815232357.GB2786@Susan>
 <20200816162642.GC86937@rowland.harvard.edu>
 <20200818041324.GA3173@Susan>
 <20200818145722.GA146472@rowland.harvard.edu>
 <20200823013025.GA11449@Susan>
 <20200823144752.GB303967@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200823144752.GB303967@rowland.harvard.edu>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

On 2020-08-23 10:47, Alan Stern wrote:
> Yes; it looks like the problem is that there are entries for this device 
> in both unusual_devs.h and unusual_uas.h -- and it doesn't help that the 
> two entries aren't identical.
> 
> The unusual_devs.h entry tells usb-storage not to use FUA, but it 
> doesn't rule out the uas driver.  And since the device claims to support 
> UAS, usb-storage bows out.  But then the unusual_uas.h entry tells uas 
> not to handle the drive, so the end result is that it doesn't get 
> handled at all.
> 
> To fix the immediate problem you should add the US_FL_IGNORE_UAS flag to 
> the entry in unusual_devs.h.

That did the trick[1]. Do you think this patch could be suitable for a
future version of the kernel?


Cyril

[1] https://framagit.org/Steap/linux/-/commit/c6b6f436f9c96a01101e9407ed481684c37fa87d
