Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9516148AFE
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jan 2020 16:09:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730252AbgAXPJh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jan 2020 10:09:37 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:48930 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728816AbgAXPJg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Jan 2020 10:09:36 -0500
Received: (qmail 1719 invoked by uid 2102); 24 Jan 2020 10:09:35 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 24 Jan 2020 10:09:35 -0500
Date:   Fri, 24 Jan 2020 10:09:35 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     JH <jupiter.hce@gmail.com>
cc:     linux-usb <linux-usb@vger.kernel.org>
Subject: Re: qmi_wwan error
In-Reply-To: <CAA=hcWSKCryEZVhWptN9iz1dbh_4rMNp0X1LMop0SA7LjYWRVQ@mail.gmail.com>
Message-ID: <Pine.LNX.4.44L0.2001241007350.1610-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 24 Jan 2020, JH wrote:

> Hi,
> 
> I am running kernel 4.19.75 on iMX6 with a uBlox SARA-R4 LTE modem,
> the modem manager is oFono, connect manager is connman. It could
> connect to LTE between half hours to hours, then it dropped LTE
> connection randomly, here are error messages, what could cause the
> qmi_wwan status received: -71 and qmi_wwan usb_submit_urb failed with
> result -19 errors?

The most likely cause is that the modem's firmware crashed, or it 
disconnected itself electronically from the USB bus.  Or else somebody 
unplugged the USB cable.

Alan Stern

> 
> [ 1018.944840] usb 1-1: USB disconnect, device number 2
> [ 1019.072845] option1 ttyUSB0: GSM modem (1-port) converter now
> disconnected from ttyUSB0
> [ 1019.130834] option 1-1:1.0: device disconnected
> [ 1019.142012] qmi_wwan 1-1:1.3: nonzero urb status received: -71
> [ 1019.147909] qmi_wwan 1-1:1.3: wdm_int_callback - 0 bytes
> [ 1019.153254] qmi_wwan 1-1:1.3: wdm_int_callback - usb_submit_urb
> failed with result -19
> [ 1019.228197] option1 ttyUSB1: GSM modem (1-port) converter now
> disconnected from ttyUSB1
> [ 1019.274475] option 1-1:1.2: device disconnected
> [ 1019.340442] qmi_wwan 1-1:1.3 wwan0: unregister 'qmi_wwan'
> usb-ci_hdrc.1-1, WWAN/QMI device
> [ 1022.827992] usb 1-1: new high-speed USB device number 3 using ci_hdrc
> [ 1023.057165] option 1-1:1.0: GSM modem (1-port) converter detected
> [ 1023.097815] usb 1-1: GSM modem (1-port) converter now attached to ttyUSB0
> [ 1023.157293] option 1-1:1.2: GSM modem (1-port) converter detected
> [ 1023.178163] usb 1-1: GSM modem (1-port) converter now attached to ttyUSB1
> [ 1023.201251] qmi_wwan 1-1:1.3: cdc-wdm0: USB WDM device
> [ 1023.243783] qmi_wwan 1-1:1.3 wwan0: register 'qmi_wwan' at
> usb-ci_hdrc.1-1, WWAN/QMI device, 16:ed:38:aa:c5:90
> 
> Thank you.
> 
> Kind regards,
> 
> - jh

