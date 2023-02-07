Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D5B468E153
	for <lists+linux-usb@lfdr.de>; Tue,  7 Feb 2023 20:35:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231262AbjBGTfw convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 7 Feb 2023 14:35:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229836AbjBGTfv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Feb 2023 14:35:51 -0500
Received: from voltaic.bi-co.net (voltaic.bi-co.net [134.119.3.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8E963B655
        for <linux-usb@vger.kernel.org>; Tue,  7 Feb 2023 11:35:47 -0800 (PST)
Received: from [192.168.0.36] (ip-037-201-145-251.um10.pools.vodafone-ip.de [37.201.145.251])
        by voltaic.bi-co.net (Postfix) with ESMTPSA id 01676210DB;
        Tue,  7 Feb 2023 20:35:45 +0100 (CET)
Message-ID: <9adb1e30b93d4e24b373b04eaf1d597daa1a1472.camel@bi-co.net>
Subject: Re: Cypress CDC ACM serial port not working correctly with
 autosuspend
From:   Michael =?ISO-8859-1?Q?La=DF?= <bevan@bi-co.net>
To:     Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org
Date:   Tue, 07 Feb 2023 20:35:45 +0100
In-Reply-To: <bde43a1913cf55e580e77ac0e059fff3c26dc093.camel@bi-co.net>
References: <8be9b56c6becd0981d1cd9c13742df6ba2975b56.camel@bi-co.net>
         <0db2a0a4-6ed4-fe06-217a-cb564f1d4a8c@suse.com>
         <bde43a1913cf55e580e77ac0e059fff3c26dc093.camel@bi-co.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.46.3 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

did you have a chance to look at the trace? I can't really make sense
of that raw output so I used Wireshark to sniff on usbmon6. I let the
remote system, which is connected via the serial port, print something
every three seconds. This is the behavior I see:

[starting trace with power/control set to "auto"]
[no communication whatsoever]
[echo -n "on" | sudo tee /sys/bus/usb/devices/6-2*/power/control]
735	23.506773	host	6.1.0	USBHUB	64	GET_STATUS Request     [Port 2]
736	23.506786	6.1.0	host	USBHUB	68	GET_STATUS Response    [Port 2]
737	23.506793	host	6.1.0	USBHUB	64	CLEAR_FEATURE Request  [Port 2: PORT_SUSPEND]
740	23.555346	6.1.0	host	USBHUB	64	CLEAR_FEATURE Response [Port 2: PORT_SUSPEND]
747	23.601999	host	6.1.0	USBHUB	64	GET_STATUS Request     [Port 2]
748	23.602018	6.1.0	host	USBHUB	68	GET_STATUS Response    [Port 2]
749	23.602027	host	6.1.0	USBHUB	64	CLEAR_FEATURE Request  [Port 2: C_PORT_SUSPEND]
750	23.602033	6.1.0	host	USBHUB	64	CLEAR_FEATURE Response [Port 2: C_PORT_SUSPEND]
756	23.622039	host	6.7.2	USB	64	URB_BULK in
757	23.622041	host	6.7.2	USB	64	URB_BULK in
758	23.622043	host	6.7.2	USB	64	URB_BULK in
759	23.622045	host	6.7.2	USB	64	URB_BULK in
760	23.622046	host	6.7.2	USB	64	URB_BULK in
761	23.622048	host	6.7.2	USB	64	URB_BULK in
762	23.622049	host	6.7.2	USB	64	URB_BULK in
763	23.622051	host	6.7.2	USB	64	URB_BULK in
764	23.622053	host	6.7.2	USB	64	URB_BULK in
765	23.622055	host	6.7.2	USB	64	URB_BULK in
766	23.622057	host	6.7.2	USB	64	URB_BULK in
767	23.622058	host	6.7.2	USB	64	URB_BULK in
768	23.622060	host	6.7.2	USB	64	URB_BULK in
769	23.622061	host	6.1.0	USBHUB	64	GET_STATUS Request     [Port 2]
770	23.622062	host	6.7.2	USB	64	URB_BULK in
771	23.622064	host	6.7.2	USB	64	URB_BULK in
772	23.622067	host	6.7.2	USB	64	URB_BULK in
773	23.622074	6.1.0	host	USBHUB	68	GET_STATUS Response    [Port 2]
818	25.411626	6.7.2	host	USB	65	URB_BULK in
[that last line contains the very first character of the printed message]
[leaving out the rest of the message and its repetitions here]
[echo -n "auto" | sudo tee /sys/bus/usb/devices/6-2*/power/control]
1219	36.891101	host	6.1.0	USBHUB	64	SET_FEATURE Request    [Port 2: PORT_SUSPEND]
1220	36.908667	6.1.0	host	USBHUB	64	SET_FEATURE Response   [Port 2: PORT_SUSPEND]
[no communication whatsoever]

I hope I haven't missed anything important here as I used filters to
get rid of the noise created by other devices on that bus.

Best regards,
Michael


Am Montag, dem 30.01.2023 um 16:44 +0100 schrieb Michael Laß:
> Hi. Thanks for looking into this.
> 
> Am Montag, dem 30.01.2023 um 14:08 +0100 schrieb Oliver Neukum:
> > 
> > thinking about this further, it is possible that remote wakeup
> > is not properly processed. Could you test autosuspend with another
> > device, for example a mouse? It should wake up after an autosuspend
> > if you press a mouse button.
> 
> I tested the behavior with a mouse connected to the same port and
> power/control set to "auto". It behaved correctly: After 1-2 seconds
> the LED of the mouse turned off and pressing a mouse button let it
> wake
> up again. This was repeatable.
> 
> I also recorded a usbmon trace as you asked for in the previous mail.
> It is attached to this mail. Unfortunately it is a bit noisy because
> there is another device connected to that USB bus internally. The
> Cypress device was connected to bus 6, port 2. I think it is device
> number 18 in that trace.
> 
> What I did during the trace:
> - Use the serial connection to launch
>      while true; do date; sleep 3; done
>   on the remote device.
> - I received the output of the very first `date` but not the upcoming
>   ones.
> - After 10 seconds or so I sent a couple of characters and afterwards
>   received another `date` output.
> 
> Best regards,
> Michael

