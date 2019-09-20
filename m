Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A2F4B90B4
	for <lists+linux-usb@lfdr.de>; Fri, 20 Sep 2019 15:34:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727632AbfITNeF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Sep 2019 09:34:05 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:50756 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725842AbfITNeF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 20 Sep 2019 09:34:05 -0400
Received: by mail-wm1-f67.google.com with SMTP id 5so2526236wmg.0
        for <linux-usb@vger.kernel.org>; Fri, 20 Sep 2019 06:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=udvjNdAaSSgWGOmksIc53vxNg6HSUZsxek6jeMJ9Yps=;
        b=JVaF1LDAISZPIF0ISG10MR77NR3Km2Y/l2OfEjqrIT83qw7lXItVe6hrN4v0tQEFsP
         S7LVUWsK5lcSHyq7i0lWhTrSWvx1fmbCAe+gTNogWiDyqCirpj/LY4DD/wCvviykFQys
         k6Vsw1RWvUO1+55XiCGeEDpfrfjoDMjBipxR/O7NzPRiJOsSr4WbVm53wwqfrhMrIugv
         pOQ1kk7LVK3gxewSQK0zeXTxA4Ef6ZggtGNn+k3wmEvH6qSc7hugGpvNC2w2B/CoEKpr
         Z2IB6eE0PhjcXMSjEyeotuPDyQT7uPDjI2PY7jvGE3sKBB2GXiEhd5nsLrtoJdRWoyMJ
         r5NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=udvjNdAaSSgWGOmksIc53vxNg6HSUZsxek6jeMJ9Yps=;
        b=quoV8yPh+oKU2VRuJBqsEP3xAEJxupOVb6lW9yQejcxaZTYSbZBd/VNhkzV7RSae9B
         QLr6B6UVsw0vofV8Gz7+M98HnRtDFJuRq8uq81XGetT9kuR3ROSXBdo21u6EoEswGo4U
         hy2IXz8nQ8Fre37tWxMw/1OMLTMRYd023poGxsOJSW335BADTWarob9gD2yLVOd5jAek
         sjq28sOQcIFRYjFEyxS0pxWx3kIFEqV3VkpfZIiREDTMKk8O/U6wUh4bMIKKzlNuFQJl
         oztAiMotNK0TPQJG/QLF6KIUKszcN+gxjeR93/hvBT4Z/aD3lWiIf8GhfTBINNeTAZo7
         FEsw==
X-Gm-Message-State: APjAAAUregdme+2/QpswvSX2DtfUgECBpO5An3XPldDbtxfpH+ayP/SI
        HR0iRSFKmmr5Eu4CZz0KOUfKz3o7dT4=
X-Google-Smtp-Source: APXvYqw0H/Z8QBHOdK9sRXubT41cAUATTv7lBB6XYkf1xsORzfHASGfiBUl4sJWfhTPxZ/TaxPMG9Q==
X-Received: by 2002:a05:600c:d4:: with SMTP id u20mr3754114wmm.66.1568986441314;
        Fri, 20 Sep 2019 06:34:01 -0700 (PDT)
Received: from dhe-pc (p54941CA4.dip0.t-ipconnect.de. [84.148.28.164])
        by smtp.gmail.com with ESMTPSA id q22sm1582311wmj.31.2019.09.20.06.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2019 06:34:00 -0700 (PDT)
From:   David Heinzelmann <heinzelmann.david@gmail.com>
X-Google-Original-From: David Heinzelmann <dhe@dhe-pc>
Date:   Fri, 20 Sep 2019 17:33:57 +0200
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] Check for changed device descriptors when a
 connection-change occurs before validating the connection.
Message-ID: <20190920153357.GB5913@dhe-pc>
References: <20190920103628.5432-1-heinzelmann.david@gmail.com>
 <20190920085556.GB521576@kroah.com>
 <20190920131726.GA5913@dhe-pc>
 <20190920121538.GA549982@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190920121538.GA549982@kroah.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Sep 20, 2019 at 02:15:38PM +0200, Greg KH wrote:
> On Fri, Sep 20, 2019 at 03:17:26PM +0200, David Heinzelmann wrote:
> > Hi,
> > 
> > sorry for the wrong patch format.
> 
> No problem, that's normal.  But please do not top-post on linux mailing
> lists.
> 
> > I am trying to detect a change. At the moment I think the change could be ignored if a
> > port connection-change occurs and the port status has again the 'PORT_CONNECTION' bit set. 
> > 
> > I have a fx3 device which does a re-enumeration after a firmware download. This is working
> > as expected and I am seeing a 'remove event' and a 'add event' monitoring via udevadm. But
> > if I connect multiple devices at the same time via an usb hub I am sometimes not receiving
> > a 'remove event' and 'add event' for a single device.
> 
> Sounds like a broken hub :)
> 

I tried different hubs but I forgot to mention that it is also possible to trigger the issue
without a hub if I reboot the devices via software at the same time. 

> > I think the problem could be that when a device disconnects and the port connection-change
> > occurs and before the 'PORT_CONNECTION' bit is checked the device could already be
> > reconnected and the 'PORT_CONNECTION' bit is set. Therefore I think it is not correct to
> > resuscitate the exisiting device.
> 
> Does your patch actually fix the issue?  When a fx3 device downloads
> firmware and re-enumerates, it should come back as a totally different
> device, which will fail this check, right?  So I don't see how this
> fixes the issues with your devices.
> 

With the patch I do not have the issue anymore. After re-enumerate the device comes back with the same
VID/PID but with a different device descriptor. Therefore the check will fail and hub_port_connect is
called which initiates a device disconnect and connect. Without this 'reconnect' lsusb still shows me 
the old device descriptor and I am not able to communicate with the device. 

> Unless all of the devices reset themselves at the same time and the hub
> doesn't like that and can't notice that it happened?
> 
> If you use a different hub, does that work properly?
> 

There is no difference if an other hub is used. It also happens without a hub when the devices are
rebooted via software. My thoughts on this is that when the device re-enumerates and the device
descriptor has changed a device disconnect and connect should be initiated instead of doing nothing?

If I understand it correctly the resuscitation is used for handling port enable-changes occured by EMI.
But when the device is doing a re-enumeration there should be no resuscitation.

David
