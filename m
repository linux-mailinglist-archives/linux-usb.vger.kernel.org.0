Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2601B83C2B
	for <lists+linux-usb@lfdr.de>; Tue,  6 Aug 2019 23:40:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728960AbfHFVke (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 6 Aug 2019 17:40:34 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:36008 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729371AbfHFVka (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 6 Aug 2019 17:40:30 -0400
Received: by mail-qk1-f196.google.com with SMTP id g18so64175704qkl.3
        for <linux-usb@vger.kernel.org>; Tue, 06 Aug 2019 14:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:content-transfer-encoding;
        bh=Js86RGa+7gv8Dz+uRj1Z85NVpKzURiNKiRWdZZpNzpY=;
        b=bqB7pni758j//HeQjWeQWyiOkiio/33jFDo5D/Rv43HC0kMCmA5p2jGfzO94R2MA88
         vL5PEaVpJPJLw6FKGxxHf3bsrOfsqZi1ED9Iwni8F9f28HbFNdfGl417EMsohc4D89Do
         5A2M4b8qmq9OHs17lIwFmC47xvsrrFhDGBBQKRkoYDTgEbinjFDvPDorGbk9IXR4GPMx
         /1cbfnsFSxcrAnqgh9Pv2xIuRA/8gBCoQ/X6NHVYHV4PSV54LQ2iY0Uuq1PtYNiVFSAx
         U6l1ta4OkHR2G9J5T9iFhoO8OwpjSEq3ovytdwQup92QaJfsMXvujUcHayqnIm1nHNeo
         ZzFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=Js86RGa+7gv8Dz+uRj1Z85NVpKzURiNKiRWdZZpNzpY=;
        b=fgYk3LVIfYs642NOhfQLFaxZMsjGCxv4oUZOToEMPfcA/Zk1BOS80KNNoz/oc8Cp4o
         KlVrOVia2b/QbLRydS/1VHCuRT8+uRUw3vylOAAlGgbJdpxy6gqlcHPSSvHwWNKJzygn
         vz2cMvHINECqEYe5W+mxzIwfmkwJtF2IDHo9ZnUSz9MpQX04nTXHwqQ9HbGFHYPp3JGw
         sNQc+r4dkVDxaghAimhPuUjyDHa8KgsJPRWBB4V9qyXroNJ7KJLrtX57IEoaDjdqQwAD
         w7u2fu2nyi4AnK6hhS6rO36AewF1LZ3pClK7de9ug+mtRwE96oKlQNn9YN771B1ZusCy
         ZP0A==
X-Gm-Message-State: APjAAAWbJOjraRkKRMYavznA/ebfM812exMwoU6A0z7lbQtxAv6oY/rU
        vk1nEyF406+22pwAhYWMqD3c2g==
X-Google-Smtp-Source: APXvYqx2q+8HP8EC16vCqUFUk+3+NZe8oYqCl8kwmI9uG79YCv0SXk/bLnAw8YF+vBdK7leiGMQEMw==
X-Received: by 2002:a37:c81:: with SMTP id 123mr740898qkm.300.1565127629072;
        Tue, 06 Aug 2019 14:40:29 -0700 (PDT)
Received: from cakuba.netronome.com ([66.60.152.14])
        by smtp.gmail.com with ESMTPSA id e7sm36124885qtp.91.2019.08.06.14.40.28
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 06 Aug 2019 14:40:28 -0700 (PDT)
Date:   Tue, 6 Aug 2019 14:40:03 -0700
From:   Jakub Kicinski <jakub.kicinski@netronome.com>
To:     Hayes Wang <hayeswang@realtek.com>
Cc:     <netdev@vger.kernel.org>, <nic_swsd@realtek.com>,
        <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>
Subject: Re: [PATCH net-next 2/5] r8152: replace array with linking list for
 rx information
Message-ID: <20190806144003.457b244e@cakuba.netronome.com>
In-Reply-To: <20190806125342.4620a94f@cakuba.netronome.com>
References: <1394712342-15778-289-albertk@realtek.com>
        <1394712342-15778-291-albertk@realtek.com>
        <20190806125342.4620a94f@cakuba.netronome.com>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 6 Aug 2019 12:53:42 -0700, Jakub Kicinski wrote:
> > @@ -744,6 +745,8 @@ struct r8152 {
> >  		void (*autosuspend_en)(struct r8152 *tp, bool enable);
> >  	} rtl_ops;
> >  
> > +	atomic_t rx_count;  
> 
> I wonder what the advantage of rx_count being atomic is, perhpas it
> could be protected by the same lock as the list head?

Okay, I see you're using it to test the queue length without the lock in
a later patch.
