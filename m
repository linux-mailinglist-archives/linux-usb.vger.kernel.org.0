Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E3552199A4
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jul 2020 09:23:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726228AbgGIHXS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Jul 2020 03:23:18 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:45646 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726006AbgGIHXR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Jul 2020 03:23:17 -0400
Received: by mail-lf1-f67.google.com with SMTP id s16so556846lfp.12
        for <linux-usb@vger.kernel.org>; Thu, 09 Jul 2020 00:23:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ny3oBP+I/wfaJYI3MuR02KIjMkWADaGiFWRFfcgpvRA=;
        b=iwnaJZA0SuGrp+BcFgcVGOHG8FdqdgFJ3/B3KN7Er7ijNdtYXCzgIavm2Rou1RuYEg
         CG47E+3ffM/nkY5kT/HFpK8qHmzcB1TIpW8T6y3tosGB087amdaEvRA69IZNNfWEMW8+
         Ofkyk/hKa3+ZJYot+1GFChU3oe1MDUI64eRbOhhlVGLsikQfIpoXviT0Tvw23zg22Qn5
         B1ZLQpgKxEey4DjmFb/qd2kU7qexrA0b1fRsIe+3+NB7sM8+21zYLXfDxAj+2uyeWtX+
         LMveTzsOMErWUrREPp0mEH4bm3E8Od97QD6fzvYfDYatj5vRbLolgX8k7I72GYut1I/x
         Dj2w==
X-Gm-Message-State: AOAM532K8eoxd0xHQtCbSs28qgOsUCBEJiHSp7RB2mpG9pjLAuu3uFZd
        Stv0V+NE/dbsFEztMb655sc=
X-Google-Smtp-Source: ABdhPJyvaxro8q0JCFVDKXv7pTfrrNHyK9xrjgRCP9HkRx90vyn37ISwxUBzGGOGFJAOqEV9KbAAVw==
X-Received: by 2002:a05:6512:752:: with SMTP id c18mr16137135lfs.141.1594279395979;
        Thu, 09 Jul 2020 00:23:15 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id o6sm537037ljh.42.2020.07.09.00.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 00:23:15 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1jtQtm-0004Pr-3L; Thu, 09 Jul 2020 09:23:14 +0200
Date:   Thu, 9 Jul 2020 09:23:14 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Greg KH <greg@kroah.com>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 00/10] USB: serial: break and sysrq fixes and cleanups
Message-ID: <20200709072314.GP3453@localhost>
References: <20200708125000.15659-1-johan@kernel.org>
 <20200708154535.GB717967@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200708154535.GB717967@kroah.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 08, 2020 at 05:45:35PM +0200, Greg Kroah-Hartman wrote:
> On Wed, Jul 08, 2020 at 02:49:50PM +0200, Johan Hovold wrote:
> > This series fixes the break and sysrq handling in the ftdi driver (which
> > have never really worked) and optimises the sysrq handling somewhat.
> > 
> > Included are also some related clean ups.
> 
> Nice!
> 
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Thanks for reviewing. Now applied.

Johan
