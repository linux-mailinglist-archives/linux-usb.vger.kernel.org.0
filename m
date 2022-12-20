Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E83F651C07
	for <lists+linux-usb@lfdr.de>; Tue, 20 Dec 2022 08:59:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232633AbiLTH7K (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Dec 2022 02:59:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232967AbiLTH7F (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 20 Dec 2022 02:59:05 -0500
Received: from h2.cmg2.smtp.forpsi.com (h2.cmg2.smtp.forpsi.com [81.2.195.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7A4B9FE3
        for <linux-usb@vger.kernel.org>; Mon, 19 Dec 2022 23:59:02 -0800 (PST)
Received: from lenoch ([91.218.190.200])
        by cmgsmtp with ESMTPSA
        id 7XWcpI8grv5uI7XWdpVXAe; Tue, 20 Dec 2022 08:59:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1671523140; bh=nimnCZA/3S4UB7RwfkDov3tvtTBo//DU3r2yie/NRoY=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=O53OkAV61k+23dKLJKJDW8RxXyG+Cg61/mUCqpEzLwfx5emFMWJUq8MbJqWK8gX25
         3OWOODS400bQt+x3V4dT++fx71eHjyp4jwGeoji3hrDeei4oyOtF07preVD01MjnXc
         1iNi/Oyv5mTklOYqnhg7kPqFYGCofX/FNZz8AvwRJSPrLyAlClZKIOBQei2Qyqt1Nr
         unLVPDg2N8zPIiwc+TkbD+Uxr5K+CnfNuMNI6aT7E/DQEgtq7Pv2/ACYuPAwXArhFI
         //j/etrstJF7w8xej/srnFAbWttF/UOuqRXZbOCQ6bLoC3+BWYrCg97i7w9X6rOA9Z
         q9p0+6LcIRojQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1671523140; bh=nimnCZA/3S4UB7RwfkDov3tvtTBo//DU3r2yie/NRoY=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=O53OkAV61k+23dKLJKJDW8RxXyG+Cg61/mUCqpEzLwfx5emFMWJUq8MbJqWK8gX25
         3OWOODS400bQt+x3V4dT++fx71eHjyp4jwGeoji3hrDeei4oyOtF07preVD01MjnXc
         1iNi/Oyv5mTklOYqnhg7kPqFYGCofX/FNZz8AvwRJSPrLyAlClZKIOBQei2Qyqt1Nr
         unLVPDg2N8zPIiwc+TkbD+Uxr5K+CnfNuMNI6aT7E/DQEgtq7Pv2/ACYuPAwXArhFI
         //j/etrstJF7w8xej/srnFAbWttF/UOuqRXZbOCQ6bLoC3+BWYrCg97i7w9X6rOA9Z
         q9p0+6LcIRojQ==
Date:   Tue, 20 Dec 2022 08:58:58 +0100
From:   Ladislav Michl <oss-lists@triops.cz>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: xHCI host dies on device unplug
Message-ID: <Y6FrQm5mYrwAnbFt@lenoch>
References: <Y45iXb6VCNiz7ZVd@lenoch>
 <Y49A1Pv6dUScQ9x/@lenoch>
 <Y5tHWwHctY6wr+CJ@lenoch>
 <abfec817-0b32-ece3-4965-7503aa5a77fa@linux.intel.com>
 <Y5zkCxQqBWR+/b4F@lenoch>
 <983a1eb1-4599-517b-6c88-63a0051ae261@linux.intel.com>
 <Y6Ct5s5fIoA9FsAt@lenoch>
 <Y6Dbh1xJucfNvwXq@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y6Dbh1xJucfNvwXq@lenoch>
X-CMAE-Envelope: MS4wfB3O/l2fEUf/bXfCj9k9dXzx7fv5iHLg339ueCssMjenLo8mhhblXOU5e0jKHw3Zd3oStsouRhe457+96V263ilMovMODrMkAQZXEaLM3PL3RkjV/JN9
 5P49uvQw7fYSAa7+rQD4+hPmdzpfvxnaaAJzG3XO99FhPlDBASXOzoz2cIOs5SHCOFZOJmWe+J1WwqirgktoZebS/tkowvXvDJY=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Dec 19, 2022 at 10:45:43PM +0100, Ladislav Michl wrote:
> On Mon, Dec 19, 2022 at 07:31:02PM +0100, Ladislav Michl wrote:
> > On Mon, Dec 19, 2022 at 02:25:46PM +0200, Mathias Nyman wrote:
> > > Looks like controller didn't complete the stop endpoint command.
> > > 
> > > Event for last completed command (before cycle bit change "c" -> "C") was:
> > >   0x00000000028f55a0: TRB 00000000035e81a0 status 'Success' len 0 slot 1 ep 0 type 'Command Completion Event' flags e:c,
> > > 
> > > This was for command at 35e81a0, which in the command ring was:
> > >   0x00000000035e81a0: Reset Endpoint Command: ctx 0000000000000000 slot 1 ep 3 flags T:c
> > > 
> > > The stop endpoint command was the next command queued, at 35e81b0:
> > >   0x00000000035e81b0: Stop Ring Command: slot 1 sp 0 ep 3 flags c
> > > 
> > > There were a lot of URBs queued for this device, and they are cancelled one by one after disconnect.
> > > 
> > > Was this the only device connected? If so does connecting another usb device to another root port help?
> > > Just to test if the host for some reason partially stops a while after last device disconnect?
> > 
> > Device is connected directly into SoC. Once connected into HUB, host doesn't die
> > (as noted in other email, sorry for not replying to my own message, so it got lost)
> > It seems as intentional (power management?) optimization. If another device is
> > plugged in before 5 sec timeout expires, host completes stop endpoint command.
> > 
> > Unfortunately I cannot find anything describing this behavior in
> > documentation, so I'll ask manufacturer support.
> 
> As support is usually slow I asked search engine first and this sounds
> familiar:
> "Synopsis Designware USB3 IP earlier than v3.00a which is configured in silicon
> with DWC_USB3_SUSPEND_ON_DISCONNECT_EN=1, would need a specific quirk to prevent
> xhci host controller from dying when device is disconnected."
> 
> usb: dwc3: Add quirk for Synopsis device disconnection errata
> https://patchwork.kernel.org/project/linux-omap/patch/1424151697-2084-5-git-send-email-Sneeker.Yeh@tw.fujitsu.com/
> 
> Any clue what happened with that? I haven't found any meaningfull traces...

Just for completeness, this turned into:
41135de1e7fd ("usb: xhci: add quirk flag for broken PED bits")
and it is enabled:
cc params 0x0220f065 hci version 0x100 quirks 0x0000000002010010

However I do not see original logic there, clearing PORT_CSC before
stopping endpoint.

> > Both solutions, do nothing or reset controller once last device is unpluged
> > works, but I doubt they are suitable for mainline kernel without further
> > investigation.
> > 
> > > Another thing is that the stop endpoint command fails after three soft reset tries,
> > > does disabling soft reset help?
> > 
> > No, this does not cause any change.
> > 
> > 	ladis
