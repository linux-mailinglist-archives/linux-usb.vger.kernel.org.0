Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5A9371A4D
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jul 2019 16:27:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730334AbfGWO16 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Jul 2019 10:27:58 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:40977 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729666AbfGWO16 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 Jul 2019 10:27:58 -0400
Received: from [192.168.0.144] ([85.219.89.53]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MvKGv-1igeqX1MA5-00rE7b; Tue, 23 Jul 2019 16:27:52 +0200
Subject: Re: High-Impact: xhci_hid - "Not enough bandwidth for new device
 state"
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
References: <27f21154-659d-67b5-ac90-b931695614c8@project-open.com>
 <20190723124457.GB5356@kroah.com>
 <41433e67-2496-97a5-a233-8026f13dfaba@project-open.com>
 <20190723132419.GA4848@kroah.com>
From:   Frank Bergmann <frank.bergmann@project-open.com>
Message-ID: <85fa403c-4e46-c0eb-d594-6d859f9cb5af@project-open.com>
Date:   Tue, 23 Jul 2019 16:27:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190723132419.GA4848@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Provags-ID: V03:K1:vsOIEhTGanrYmBfkiZTNZw0jUTaoKhFPvOqbT4IRbCHeWktRVT6
 ylO2X+wTk5fo4GA8mvI12ijnNPVZdAyi2G5g+/W8aT/Lyx515DkVf2WRd08vEFgtJEGgnTt
 N5louq5XlkTB48YmrztNStDtEO8+JXQvaGVKVpJtIXQV2imrc6b9JiKl5SBFYHqBhcfNcja
 Hsud2VnjnV3kzug/kTEXg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:9/K3g3AJxRA=:NJJy/2p3t5kYsibZ3PCkWd
 BLoAgQZWOdInZNx1v+qOolbZQjOQv9cmdRX80GY9wlGNsKc/+KjJsH33zJs7Nq819Jhes9yfq
 weEyYLQe8DfjTe2ZleRPLThTqwDOukJgzMDWyn+/rd+/t7djoM6jk15UjRGg5lUEflPFTF03J
 ZCj5tFf3r+WF63aBYyu9M/VumnLlLhU2ZbTQJIrRvIdBIs3BC6TTJHRgLd6BQLG2i1JDcMBhs
 BRvFQBEuh7oEAnANY3+6Yy07i1nh1X9UTrIwW9nGC+h6ICMN54rIxY41/XwQsoVQ96XuPkinW
 VmTXduQPn+UL2jlBd217lyrUQos+9xD1JWDSRA7LTL2cyd4cxqt41Q1KqLQerNJHBq+mRCMYW
 cRQho5BapMVGYHCqEmB9QA8aKbMXHF1fwHG41nTCTFDNRGqiRPhoG9yWPrAG5yrlWYFqTk1xl
 AwVVhoJAH5GGT/eiUqDeSdARhZieHRJKAY2Ey2pD5x/fmpn9uOwAcBfKW2piMbtveg8254EUU
 yiCfnFiWJpiYLWtCCFQdH4f5B547rpubp0rLoeZDTByDh8Oiv1nk/iLySgLex+Pq43qLYzL+u
 9lnEQ8c2YuemHxJhtGoYKiqsLtRotDVl1PvYn/GLPwm80FFP2mAEYa/PSHUiHuz4u7iM91Qu/
 XcauSAYq8uMnoIbZExFWZ1fDADhzWWu4jmoAjuLzzAJJixJa9HWIrqrRBD61JZpNXv6CcXNAp
 Z9tsUBxt4e7MN9Rw0xRlEQWwW3omU+rJjWcT0XyqY6g1HhqX57zObi/qcDk3vUsxFX+/UW1Rp
 NMeuzy/
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi!


I just want to make the case that this is quite an important issue. I 
was very surprised to hear from the CIO of one of our customers that 
they had the same issue. This kept them from offering Ubuntu and an 
option for their Dell laptops. Like myself, these guys need to run 
GoToMeeting/WebEx together with a Windows VM for business.


I understand this is probably a difficult bug and that it is difficult 
to reproduce. However, this combination of WebCam + VM is required by 
everybody except for a very few privileged "Linux only" developers.



 > It all depends on what that devices are asking for


The Logitech C922 has a H.264 compression on the chip. The "bandwidth 
calculator" (https://www.google.es/search?q=H.264+bandwidth) says it 
needs 1024kBps for 1080p @ 30fps.

Not sure if this is true, and I'm not sure what the devices actually 
does, though...


 > Linux solved


Ok, so you have a clear idea what part of the driver causes the error, 
that's a step forward.


But I can't imagine it's "real" bandwidth. USB 3.1 can handle two 
full-HD screens plus a Gigabit Ethernet on the same 5GBit lanes... A few 
megabit for compressed vido plus a few _kilo_ bits/s for audio...

=> Is there a way to debug these bandwidth requests for me? Maybe you 
want to include bandwidth requests in the kernel logs in the future if 
these issues are so wide spread?

=> Maybe you can recommend me a WebCam with tripod option that is known 
to work well with Linux?

=> From what I understand I should now test with VirtualBox and KVM/QEMU 
and check if the same issue appears. I will do this and let you know 
about the results.


 > configuration of your devices and root hubs


I've got a brand new Dell XPX 15 9370 Laptop. No other USB hubs, 
devices, no change to any configuration. I chose the model because it is 
supposed to be the same that Linus Torvalds uses (well, XPS 13...)



I can offer OpenVPN access to my laptop for reproducing the issues. I 
also offer to buy a Logitech C922 WebCam if somebody wants to get 
seriously down to this issue.


Best Regards,
Frank

---
Frank Bergmann
Dipl.-Ing., MBA
Founder ]project-open[
Tel: +34 932 202 088 (Spain)
Cell: +34 609 953 751
Fax: +34 932 890 729

mailto:frank.bergmann@project-open.com
http://www.project-open.com
http://www.twitter.com/projop
http://www.facebook.com/projectopen.org
http://www.linkedin.com/in/fraber
http://www.xing.com/profile/Frank_Bergmann23

