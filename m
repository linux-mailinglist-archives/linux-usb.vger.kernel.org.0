Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C9E4493177
	for <lists+linux-usb@lfdr.de>; Wed, 19 Jan 2022 00:48:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235627AbiARXst convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 18 Jan 2022 18:48:49 -0500
Received: from mail.nrtc.syn-alias.com ([129.213.214.220]:59432 "EHLO
        mail.nrtc.syn-alias.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233354AbiARXss (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Jan 2022 18:48:48 -0500
X-Authed-Username: Y2thbWFzQGRzbGV4dHJlbWUuY29t
Received: from [10.219.152.7] ([10.219.152.7:48592] helo=md18.nrtc.email-ash1.sync.lan)
        by mail.informnet.com (envelope-from <ckamas@dslextreme.com>)
        (ecelerity 4.3.1.69410 r(Core:4.3.1.0)) with ESMTP
        id E7/09-05548-FD157E16; Tue, 18 Jan 2022 18:48:47 -0500
Date:   Tue, 18 Jan 2022 18:48:47 -0500 (EST)
From:   "ckamas dslextreme.com" <ckamas@dslextreme.com>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Message-ID: <1959797703.662115317.1642549727537.JavaMail.zimbra@dslextreme.com>
In-Reply-To: <YeZcISwRLAt8a4mO@kroah.com>
References: <04f3e890-3e6f-4ad2-bfa8-f4cb0e672487@dslextreme.com> <5700736a-1ba4-9752-e73e-9d54829ce7bf@dslextreme.com> <YeZcISwRLAt8a4mO@kroah.com>
Subject: Re: Debugging crash in kernel module usbip-host
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
X-Originating-IP: [99.92.213.82]
X-Mailer: Zimbra 8.8.15_GA_4173 (ZimbraWebClient - GC97 (Linux)/8.8.15_GA_4173)
Thread-Topic: Debugging crash in kernel module usbip-host
Thread-Index: SlEABysY/Eco0JM8/UmnMO42pEFLQA==
X-Vade-Verdict: clean
X-Vade-Analysis-1: gggruggvucftvghtrhhoucdtuddrgedvvddrudeggddufecutefuodetggdotefrodftvfcurfhrohhf
X-Vade-Analysis-2: ihhlvgemucfujgfpteevqfftpdfptffvvedpgffpggdqpfftvfevpdfqfgfvnecuuegrihhlohhuthem
X-Vade-Analysis-3: uceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvkfgjfhfugggt
X-Vade-Analysis-4: gfhiofhtsehtqhgttdertdejnecuhfhrohhmpedftghkrghmrghsucgushhlvgigthhrvghmvgdrtgho
X-Vade-Analysis-5: mhdfuceotghkrghmrghssegushhlvgigthhrvghmvgdrtghomheqnecuggftrfgrthhtvghrnhepudeu
X-Vade-Analysis-6: udekgfdvfeelveettdetkeetgeffiefgtedttefgtdfhgfdvudefgfejgeeunecukfhppedutddrvddu
X-Vade-Analysis-7: ledrudehvddrjedpleelrdelvddrvddufedrkedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
X-Vade-Analysis-8: rghmpehinhgvthepuddtrddvudelrdduhedvrdejpdhhvghlohepmhguudekrdhnrhhttgdrvghmrghi
X-Vade-Analysis-9: lhdqrghshhdurdhshihntgdrlhgrnhdpmhgrihhlfhhrohhmpegtkhgrmhgrshesughslhgvgihtrhgv
X-Vade-Analysis-10: mhgvrdgtohhmpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhg
X-Vade-Analysis-11: pdhrtghpthhtoheplhhinhhugidquhhssgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpmhhtrghhohhs
X-Vade-Analysis-12: thepshhmthhprdhnrhhttgdrvghmrghilhdqrghshhdurdhshihntgdrlhgrnhdpnhgspghrtghpthht
X-Vade-Analysis-13: ohepvddprghuthhhpghushgvrhep
X-Vade-Client: NRTC
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Greg,

Thanks for the feedback. I will update the kernel to 5.16 and verify the crash there too.

In the meantime, can you point me to where I can learn more about how these "stub" functions are generated?

Thanks,
Chuck



 0) + 14.167 us   |  stub_complete [usbip_host]();
 ------------------------------------------
 0)    <idle>-0    =>  stub_tx-300  
 ------------------------------------------

 0)               |    stub_send_ret_submit [usbip_host]() {
 0)   6.250 us    |      stub_free_priv_and_urb [usbip_host]();
 0) ! 130.781 us  |    }
 0)   7.135 us    |    stub_send_ret_unlink [usbip_host]();
 ------------------------------------------
 0)  stub_tx-300   =>  stub_rx-299  
 ------------------------------------------

 0) + 30.312 us   |    stub_complete [usbip_host]();
 0)               |    stub_complete [usbip_host]() {
 0)   2.708 us    |      stub_enqueue_ret_unlink [usbip_host]();
 0)   5.156 us    |      stub_free_priv_and_urb [usbip_host]();
 0) + 19.948 us   |    }
---------------------------------
[0]kdb> 



----- Original Message -----
From: "Greg KH" <gregkh@linuxfoundation.org>
To: "Chuck Kamas" <ckamas@dslextreme.com>
Cc: linux-usb@vger.kernel.org
Sent: Monday, January 17, 2022 10:20:17 PM
Subject: Re: Debugging crash in kernel module usbip-host

On Mon, Jan 17, 2022 at 04:49:06PM -0800, Chuck Kamas wrote:
>  sysname    Linux
>  release    5.4.72-v7
>  version    #1 SMP Mon Oct 19 11:12:20 UTC 2020

That is a very old and obsolete and known-buggy kernel, can you please
try 5.16?

thanks,

greg k-h
