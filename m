Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11A08EE7B8
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2019 19:53:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728377AbfKDSxh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Nov 2019 13:53:37 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:35551 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728268AbfKDSxh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 Nov 2019 13:53:37 -0500
Received: by mail-pf1-f193.google.com with SMTP id d13so12974853pfq.2
        for <linux-usb@vger.kernel.org>; Mon, 04 Nov 2019 10:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=IzReVKsLRHqg8fEhfeFiezQCAhg/Zw2TYzjeAkQCFoQ=;
        b=iJ13untWbLzFQLLY7yBxNAFnnrk0Vb2V55LstSq4YW1CMbL4dupmxYMko8gTS829EF
         DIsANaD2xvuMDrv4ER7+I/qMa/Igu2ZO1g8tXLOcq565gsUrVFYbj673GjP2LG50yja7
         sVHjcOtkOGCpS5gRw2SplarWQpSY2vCAFd7j9FHbZf9i39X64cZJ7WIxAdxJg5sSSpya
         ok9u1N63n7V3nnN0/fYg8cMTj+buUrtUz8ROnzj3mIDtejoQZQ7zzXagkhzltP9YzUPe
         uEG87u7IrX0CsFWiPwZ+ZlWwQisumrARZe+D1tjTHrmrfqog05JejLkJMM82+fe3LBgk
         RO9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=IzReVKsLRHqg8fEhfeFiezQCAhg/Zw2TYzjeAkQCFoQ=;
        b=iOe7Aza1Qm64AN70k8vnZu1kuksVNR8QCWhbKp8lJizCk0XFMj40vTsR1dTxtoTUvO
         QzmajCYlxM4VSI8bp6e8jWrwr/W+MbNeaJIlaEaSfkdklmSXr/VmLBdi9lJVMnUS+mfh
         Se0fKFyMv38BAQv24XDddopGzovlXyBfOrstAe73wi+EnhDEqsXKyUG+uVVC1ge1aMM0
         syLIizC0FnMOISGzdiQ57sUL1obhgBcSdkjI4RmQmfw/fmCMfT/Lv4ovRJw4SI1VHZtL
         EnNj7X7O3OR2vlJQgnbKrO781Gp7VCBM8tuYbXU2TjdCfH9vg7ee3F/8r6/JDBw9ewTr
         745A==
X-Gm-Message-State: APjAAAWyCUuhV2GkPRQrEonBEvwwKLcnBaGA7itJKLjy2VGGwITq2SlQ
        SkphMAWysBj2Cx9AD/M1iwdya9b4
X-Google-Smtp-Source: APXvYqxmGwbGGbIhjjy9fO6DbfRIBOZFSYjummaq3WhjgwDdK1Sj7tBvyIVtvt8dOtJTiIxdHsvtsQ==
X-Received: by 2002:a17:90a:c2:: with SMTP id v2mr769875pjd.140.1572893615733;
        Mon, 04 Nov 2019 10:53:35 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x9sm22728177pje.27.2019.11.04.10.53.33
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Nov 2019 10:53:34 -0800 (PST)
Date:   Mon, 4 Nov 2019 10:53:33 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Ajay Gupta <ajayg@nvidia.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v4 00/18] usb: typec: API improvements
Message-ID: <20191104185332.GA5250@roeck-us.net>
References: <20191104142435.29960-1-heikki.krogerus@linux.intel.com>
 <20191104150524.GA2237300@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191104150524.GA2237300@kroah.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 04, 2019 at 04:05:24PM +0100, Greg Kroah-Hartman wrote:
> On Mon, Nov 04, 2019 at 05:24:17PM +0300, Heikki Krogerus wrote:
> > Hi,
> > 
> > I removed the extra error messages from ucsi_acpi.c and ucsi_ccg.c as
> > requested by Guenter.
> 
> I've applied the first 11 patches now, as it looks like Guenter wanted a
> better comment in patch 12 :(
> 
Sounds like I am too picky. Feel free to ignore and go ahead.  
FTR, I'll send a Reviewed-by: for that patch.

Guenter
