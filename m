Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58CC41138E7
	for <lists+linux-usb@lfdr.de>; Thu,  5 Dec 2019 01:40:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728549AbfLEAkU convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Wed, 4 Dec 2019 19:40:20 -0500
Received: from nef2.ens.fr ([129.199.96.40]:56237 "EHLO nef.ens.fr"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728011AbfLEAkT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 4 Dec 2019 19:40:19 -0500
X-ENS-nef-client: 129.199.127.85
Received: from mail.phys.ens.fr (mail.phys.ens.fr [129.199.127.85])
          by nef.ens.fr (8.14.4/1.01.28121999) with ESMTP id xB50eH2t015328
          for <linux-usb@vger.kernel.org>; Thu, 5 Dec 2019 01:40:17 +0100
Received: from dalek.localnet (tudia.pck.nerim.net [213.41.147.198])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by mail.phys.ens.fr (Postfix) with ESMTPSA id 07FA71A14DE
        for <linux-usb@vger.kernel.org>; Thu,  5 Dec 2019 01:40:16 +0100 (CET)
From:   =?ISO-8859-1?Q?=C9ric?= Brunet <eric.brunet@ens.fr>
To:     linux-usb@vger.kernel.org
Subject: Bug report: dvd player on USB3 port shows first GiB only
Date:   Thu, 05 Dec 2019 01:40:16 +0100
Message-ID: <9269932.zcQTiTrDoZ@dalek>
In-Reply-To: <7725295.NyiUUSuA9g@dalek>
References: <7725295.NyiUUSuA9g@dalek>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="iso-8859-1"
X-Rspamd-Queue-Id: 07FA71A14DE
X-Spamd-Result: default: False [-5.03 / 150.00];
         ARC_NA(0.00)[];
         R_SPF_NEUTRAL(0.00)[?all:c];
         FROM_HAS_DN(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         TO_DN_NONE(0.00)[];
         HFILTER_HELO_IP_A(1.00)[dalek.localnet];
         RCPT_COUNT_ONE(0.00)[1];
         DMARC_NA(0.00)[ens.fr];
         HFILTER_HELO_NORES_A_OR_MX(0.30)[dalek.localnet];
         NEURAL_HAM(-0.00)[-1.000,0];
         IP_SCORE(-3.73)[ip: (-9.81), ipnet: 213.41.128.0/17(-4.91), asn: 13193(-3.89), country: FR(-0.06)];
         RCVD_COUNT_ZERO(0.00)[0];
         FROM_EQ_ENVFROM(0.00)[];
         R_DKIM_NA(0.00)[];
         MID_RHS_NOT_FQDN(0.50)[];
         ASN(0.00)[asn:13193, ipnet:213.41.128.0/17, country:FR];
         MIME_TRACE(0.00)[0:+];
         BAYES_HAM(-3.00)[100.00%]
X-Rspamd-Server: mail
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (nef.ens.fr [129.199.96.32]); Thu, 05 Dec 2019 01:40:17 +0100 (CET)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,
 
When I plug my external dvd player on my laptop, only the first GiB of the
dvd can be accessed. In practice, when I read the dvd, vlc or other
programs crash after about 20 minutes of movie.
 
In fact, the lseek(fd, 0, SEEK_END) system call returns 1073741312 ( which
is equal to 1 GiB - 512 B) whereas the DVD is about 7 GiB.
 
This occurs on any DVD. The DVD player works correctly on other computers.
 
What is different on my computer is that it is quite new (6 months old) and
only has USB3 ports. My DVD player has a USB2 plug and I am using a small
adapter between the two plugs. I have tried several adapters.
 
I have found a work-around (so that it is not a hardware fault). To see the
full DVD, I need to 1) suspend the laptop with the DVD player unplugged
2) plug the DVD player. I hear its motor running for a couple of seconds
3) wait for the motor to stop
4) resume the laptop with the DVD player still plugged in
 
Then, I can access the whole DVD and watch my movies. I imagine that when I
plug the dvd in the suspended computer, the device discovery is done by the
bios, and this is what makes the difference, but hey! I know nothing about
this stuff and I am probably wrong.
 
Note that plugging the DVD player with the computer awake and doing a
suspend/resume cycle is not enough.
 
The computer is a Dell XPS-13. I am currently running an up-to-date fedora
31, with kernel 5.3.13-300.fc31. However, I have had this problem since I
got the computer 6 months ago, and I was then with fedora 30 (or maybe 29 ?
I don't remember). I kept hoping that the problem would magically go away
after some update...
 
I am not sure what information to provide. Here is what happens in dmesg
when I plug in the DVD:
 
[ 1330.427205] usb 1-1: new high-speed USB device number 5 using xhci_hcd 
[ 1330.561344] usb 1-1: New USB device found, idVendor=0e8d, idProduct=1887, bcdDevice= 0.00 
[ 1330.561349] usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3 
[ 1330.561352] usb 1-1: Product: HP External USB Optical Drive 
[ 1330.561355] usb 1-1: Manufacturer: Hewlett-Packard Company 
[ 1330.561357] usb 1-1: SerialNumber: KZ6E4D43127          
[ 1330.565611] usb-storage 1-1:1.0: USB Mass Storage device detected 
[ 1330.565893] scsi host0: usb-storage 1-1:1.0 
[ 1331.601229] scsi 0:0:0:0: CD-ROM            hp       CDDVDW GP60NB50  RP02 PQ: 0 ANSI: 0 
[ 1331.607883] sr 0:0:0:0: Power-on or device reset occurred 
[ 1331.622188] sr 0:0:0:0: [sr0] scsi3-mmc drive: 24x/24x writer dvd-ram cd/rw xa/form2 cdda tray 
[ 1331.623078] sr 0:0:0:0: Attached scsi CD-ROM sr0 
[ 1331.623618] sr 0:0:0:0: Attached scsi generic sg0 type 5 
[ 1331.763885] pktcdvd: pktcdvd0: writer mapped to sr0 
[ 1344.560361] sr 0:0:0:0: [sr0] tag#0 FAILED Result: hostbyte=DID_OK driverbyte=DRIVER_SENSE 
[ 1344.560368] sr 0:0:0:0: [sr0] tag#0 Sense Key : Illegal Request [current]  
[ 1344.560374] sr 0:0:0:0: [sr0] tag#0 Add. Sense: Read of scrambled sector without authentication 
[ 1344.560380] sr 0:0:0:0: [sr0] tag#0 CDB: Read(10) 28 00 00 00 02 00 00 00 02 00 00 00 
[ 1344.560386] blk_update_request: I/O error, dev sr0, sector 2048 op 0x0:(READ) flags 0x80700 phys_seg 1 prio class 0 
[ 1344.679369] sr 0:0:0:0: [sr0] tag#0 FAILED Result: hostbyte=DID_OK driverbyte=DRIVER_SENSE 
[ 1344.679376] sr 0:0:0:0: [sr0] tag#0 Sense Key : Illegal Request [current]  
[ 1344.679382] sr 0:0:0:0: [sr0] tag#0 Add. Sense: Read of scrambled sector without authentication 
[ 1344.679387] sr 0:0:0:0: [sr0] tag#0 CDB: Read(10) 28 00 00 00 02 01 00 00 01 00 00 00 
[ 1344.679393] blk_update_request: I/O error, dev sr0, sector 2052 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0 
[ 1344.679398] Buffer I/O error on dev sr0, logical block 513, async page read 
[ 1345.517292] sr 0:0:0:0: [sr0] tag#0 FAILED Result: hostbyte=DID_OK driverbyte=DRIVER_SENSE 
[ 1345.517300] sr 0:0:0:0: [sr0] tag#0 Sense Key : Illegal Request [current]  
[ 1345.517306] sr 0:0:0:0: [sr0] tag#0 Add. Sense: Read of scrambled sector without authentication 
[ 1345.517311] sr 0:0:0:0: [sr0] tag#0 CDB: Read(10) 28 00 00 07 fe 80 00 00 3c 00 00 00 
[ 1345.517317] blk_update_request: I/O error, dev sr0, sector 2095616 op 0x0:(READ) flags 0x80700 phys_seg 26 prio class 0 
[ 1345.588259] sr 0:0:0:0: [sr0] tag#0 FAILED Result: hostbyte=DID_OK driverbyte=DRIVER_SENSE 
[ 1345.588267] sr 0:0:0:0: [sr0] tag#0 Sense Key : Illegal Request [current]  
[ 1345.588273] sr 0:0:0:0: [sr0] tag#0 Add. Sense: Read of scrambled sector without authentication 
[ 1345.588278] sr 0:0:0:0: [sr0] tag#0 CDB: Read(10) 28 00 00 07 fe 80 00 00 01 00 00 00 
[ 1345.588284] blk_update_request: I/O error, dev sr0, sector 2095616 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0 
[ 1345.588290] Buffer I/O error on dev sr0, logical block 523904, async page read 
[ 1345.659237] sr 0:0:0:0: [sr0] tag#0 FAILED Result: hostbyte=DID_OK driverbyte=DRIVER_SENSE 
[ 1345.659245] sr 0:0:0:0: [sr0] tag#0 Sense Key : Illegal Request [current]  
[ 1345.659251] sr 0:0:0:0: [sr0] tag#0 Add. Sense: Read of scrambled sector without authentication 
[ 1345.659257] sr 0:0:0:0: [sr0] tag#0 CDB: Read(10) 28 00 00 07 fe 81 00 00 01 00 00 00 
[ 1345.659262] blk_update_request: I/O error, dev sr0, sector 2095620 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0 
[ 1345.659268] Buffer I/O error on dev sr0, logical block 523905, async page read

What else can I give you ?

I am not subscribed to the mailing-list; please CC me any answer.
 
Thanks,
 
	Éric Brunet


