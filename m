Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97AD7B8EDE
	for <lists+linux-usb@lfdr.de>; Fri, 20 Sep 2019 13:17:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392158AbfITLRc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Sep 2019 07:17:32 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:38653 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389010AbfITLRb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 20 Sep 2019 07:17:31 -0400
Received: by mail-wm1-f68.google.com with SMTP id 3so1889624wmi.3
        for <linux-usb@vger.kernel.org>; Fri, 20 Sep 2019 04:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=npDCR49kaS8S9biXFVcPKJkQ6pxjvEuxDxsjO+4LXBY=;
        b=AoJ4ffRQeYVmEsZdcstKRVLtTT46jM0pLawFdK4X3vdLsltCqEiMgFbekQY8jddHWL
         CkzXisj604jF9FLhhUylSpUvoPZeWNgWXem0JUay8ubEfToE6E4KPUjLviygYDCHQWbx
         Mk9cosVP+5O0gvN8tL65DyxrzHOFiprnkmrSTyIQx61ULLwSQJi3jBDElC2NZWzHCZ7p
         LzANs/AH1FMkLJI8TLvzmLmObm4pP1lYujDl/5uxtLyTs+CWv/h+x/ZDx85+4hYROZ+P
         9uanrVYbcJ4Jh1xmGSODT/yL/M67M6ODvBzV3e/gBDwSRvtwe8x6cyzngvKaGj8YtAq8
         GFgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=npDCR49kaS8S9biXFVcPKJkQ6pxjvEuxDxsjO+4LXBY=;
        b=mMGfjAAwpp/gVjBVHaFhPHPhHsTCDh/Cx0W86u8ASzHQ3iulQx8aTFwO7l3V1KoCvx
         pUPVrEViItujRvD28GNOWc7Yy9nMFOOFWbQlp5bC0B1xbC0HOObR5pT3f0VsSzGa8vU2
         94WkeVMcS6fLWTpWIdutGraWi8fElt3TtDECVP2n+rO6SYsklhLD5xkpy+xidbOHJyBU
         wW5x44N34hlgvbpu5Rh/MSBmKbTWH1rGq+E35IB7Bre8vIVHWsT/qokbkY0qeDUWwS4H
         h6pFbv8kQeq+h6qCHKIqbDNpXeWPlY2DedDdACMWv0j7gEusD1KiATawzl/BDgPVM6kK
         XAbg==
X-Gm-Message-State: APjAAAU5eBKvtXTlEBo7ZyuzuMH7qSY3l/ROjOWalacuIhjDx7Uwv0vO
        E8XoJbcllvJEoivl02jPii8=
X-Google-Smtp-Source: APXvYqx1cPXDGarh9hvBLYtoHx3SVc2znU9ITwgipu8OL7mXS06V4uGe7rmypfAPMEBT0bDyWw3e6Q==
X-Received: by 2002:a1c:61d6:: with SMTP id v205mr1851127wmb.35.1568978249797;
        Fri, 20 Sep 2019 04:17:29 -0700 (PDT)
Received: from dhe-pc (p54941CA4.dip0.t-ipconnect.de. [84.148.28.164])
        by smtp.gmail.com with ESMTPSA id y186sm3069900wmb.41.2019.09.20.04.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2019 04:17:29 -0700 (PDT)
From:   David Heinzelmann <heinzelmann.david@gmail.com>
X-Google-Original-From: David Heinzelmann <dhe@dhe-pc>
Date:   Fri, 20 Sep 2019 15:17:26 +0200
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     David Heinzelmann <heinzelmann.david@gmail.com>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] Check for changed device descriptors when a
 connection-change occurs before validating the connection.
Message-ID: <20190920131726.GA5913@dhe-pc>
References: <20190920103628.5432-1-heinzelmann.david@gmail.com>
 <20190920085556.GB521576@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190920085556.GB521576@kroah.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

sorry for the wrong patch format.

I am trying to detect a change. At the moment I think the change could be ignored if a
port connection-change occurs and the port status has again the 'PORT_CONNECTION' bit set. 

I have a fx3 device which does a re-enumeration after a firmware download. This is working
as expected and I am seeing a 'remove event' and a 'add event' monitoring via udevadm. But
if I connect multiple devices at the same time via an usb hub I am sometimes not receiving
a 'remove event' and 'add event' for a single device.

I think the problem could be that when a device disconnects and the port connection-change
occurs and before the 'PORT_CONNECTION' bit is checked the device could already be
reconnected and the 'PORT_CONNECTION' bit is set. Therefore I think it is not correct to
resuscitate the exisiting device.

On Fri, Sep 20, 2019 at 10:55:56AM +0200, Greg KH wrote:
> On Fri, Sep 20, 2019 at 12:36:28PM +0200, David Heinzelmann wrote:
> > When a port connection-change occurs the hub driver tries to resuscitate an existing device.
> > Activated from a firmware download a usb device can re-enumerate with new or changed device
> > descriptors. Therefore it will be checked for changed device descriptors before the connection
> > is resuscitated and the connection-change event is ignored.
> 
> Please wrap your lines at 72 columns :(
> 
> Anyway, what problem are you trying to solve here?  What is broken with
> how things work today?  Are you trying to ignore a change that is
> currently showing up as a change, or trying to do the opposite?
> 
> thanks,
> 
> greg k-h
