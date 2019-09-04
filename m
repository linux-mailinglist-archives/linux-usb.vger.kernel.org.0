Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2E57A8A3A
	for <lists+linux-usb@lfdr.de>; Wed,  4 Sep 2019 21:25:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732088AbfIDP6m (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Sep 2019 11:58:42 -0400
Received: from dsl092-148-226.wdc2.dsl.speakeasy.net ([66.92.148.226]:51204
        "EHLO nathanst.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732073AbfIDP6m (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Sep 2019 11:58:42 -0400
Received: from holmes.nathanst.com (nathanst@localhost [127.0.0.1])
        by nathanst.com (8.13.4/8.13.4/Debian-3sarge3) with ESMTP id x84FwVjg023043;
        Wed, 4 Sep 2019 11:58:31 -0400
Received: (from nathanst@localhost)
        by holmes.nathanst.com (8.13.4/8.13.4/Submit) id x84FwVAA023041;
        Wed, 4 Sep 2019 11:58:31 -0400
Date:   Wed, 4 Sep 2019 11:58:31 -0400
From:   Nathan Stratton Treadway <vgerlists@nathanst.com>
To:     Julian Sikorski <belegdol@gmail.com>
Cc:     Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org
Subject: Re: Lacie Rugged USB3-FW does not work with UAS
Message-ID: <20190904155831.GE4337@nathanst.com>
References: <ffe7a644-bd56-3f3e-4673-f69f21f4132b@gmail.com> <1566567572.8347.54.camel@suse.com> <bedb5e9f-5332-4905-2237-347d7ea77447@gmail.com> <0eaecb64-4c67-110d-8493-31dd7fd58759@gmail.com> <1566595393.8347.56.camel@suse.com> <5f8f8e05-a29b-d868-b354-75ac48d40133@gmail.com> <a090c289-6b1a-8907-271a-069aea96ba2f@gmail.com> <1567424535.2469.11.camel@suse.com> <2a06a5dd-3fc9-0aac-a7e2-67be35e2d6bb@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a06a5dd-3fc9-0aac-a7e2-67be35e2d6bb@gmail.com>
User-Agent: Mutt/1.5.9i
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Sep 02, 2019 at 22:10:01 +0200, Julian Sikorski wrote:
> thanks for the patch! It appears that we got the drives confused, the 
> one needing quirks is 059f:1061. Unfortunately, even after hand-editing 
> the patch to match (attached for confirmation), uas is still not 
> working. The dmesg log is unchanged:
> 
> [   67.925435] usb 2-4: new SuperSpeed Gen 1 USB device number 2 using 
> xhci_hcd
> [   67.947738] usb 2-4: New USB device found, idVendor=059f, 
> idProduct=1061, bcdDevice= 0.01
> [   67.947739] usb 2-4: New USB device strings: Mfr=2, Product=3, 
> SerialNumber=1
> [   67.947740] usb 2-4: Product: Rugged USB3-FW
> [   67.947741] usb 2-4: Manufacturer: LaCie
> [   67.947742] usb 2-4: SerialNumber: 00000000157f928920fa
> [   67.978140] usbcore: registered new interface driver usb-storage
> [   68.007356] scsi host12: uas
> [   68.007520] usbcore: registered new interface driver uas
> [   68.007781] scsi 12:0:0:0: Direct-Access     LaCie    Rugged FW USB3 
>  051E PQ: 0 ANSI: 6
[...] 
> [  280.017821] usb 2-4: USB disconnect, device number 2
> [  280.017869] scsi host12: uas_eh_device_reset_handler FAILED err -22
> [  280.017876] sd 12:0:0:0: Device offlined - not ready after error recovery
> [  280.043423] sd 12:0:0:0: [sdb] Optimal transfer size 33553920 bytes
> [  280.204419] sd 12:0:0:0: [sdb] Read Capacity(16) failed: Result: 
> hostbyte=DID_ERROR driverbyte=DRIVER_OK
> [  280.204422] sd 12:0:0:0: [sdb] Sense not available.
> [  280.324417] sd 12:0:0:0: [sdb] Read Capacity(10) failed: Result: 
> hostbyte=DID_ERROR driverbyte=DRIVER_OK
> [  280.324420] sd 12:0:0:0: [sdb] Sense not available.


Oliver, does the presence of the "Read Capacity(16)" message here
indicate that either the quirk was not applied to the device or that
the patch didn't have the expected effect?

(Is there any way to check what quirks flags are actually in effect for
a device attached to the UAS driver?  For the usb-storage driver there's
both a "Quirks match for vid..." dmesg line and the Quirks: line in the 
/proc/scsi/usb-storage/* file -- but neither of those seem to exist for
the UAS driver....)

							Nathan

