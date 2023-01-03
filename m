Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81D7C65BCD4
	for <lists+linux-usb@lfdr.de>; Tue,  3 Jan 2023 10:09:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233070AbjACJJg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Jan 2023 04:09:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236872AbjACJJa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 3 Jan 2023 04:09:30 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64907315
        for <linux-usb@vger.kernel.org>; Tue,  3 Jan 2023 01:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.at; s=s31663417;
        t=1672736962; bh=5BcAo4hXqCN2FLyqhRt0tSh+2BuGurgJt/WdK9ggPWU=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=Z1yMH9sfxBwX0OzLnSk0msGBF+an4b+xA/2dagUTmvFEaA5wYqyVTB06amg02qYUi
         cIgaULOUIJ4Fi6kPJVSpbqqIMYafHqkCfageqPJEUFTmOnXmY4951+/33u/tTLECQk
         eNzuKrHWsU6+UUZM7Rrhd4cOh5XDrij7aqoFg8ceBdZWOHxQt36Keaf6FkJ3W9zYlC
         Xb6rHaVR2lnxWS57ICVbrrW4OD7UHdhSup84VaskvR0z/epfdyuvrY50G4Fj7dwFoJ
         yGPMdh15Do0tdgqwn3dWvfChXU7jQ+hZWnIRev0/hF5i48f6oc41eE6zt/ylXconQy
         BuV3zBEv513aA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.70] ([81.189.232.75]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MjS54-1oW7kh3QxG-00kxC0; Tue, 03
 Jan 2023 10:09:21 +0100
Message-ID: <a324ff2a-d014-83d2-4f30-b865db7c352b@gmx.at>
Date:   Tue, 3 Jan 2023 10:08:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: Possible problem with thunderbolt 4
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org,
        "michael.simon@cpsd.at" <michael.simon@cpsd.at>
References: <Y6sBI+xrkQaWtQxo@black.fi.intel.com>
 <588ed5c7-864f-46b5-d7d7-af6c32ca2c52@gmx.at>
 <Y66vWYdLLAOG81+f@black.fi.intel.com>
 <c334eb1f-1130-04d7-e7a6-cce9a90fd2e8@gmx.at>
 <Y67RoYvbRC6OgfOq@black.fi.intel.com>
 <272a5f28-5733-3aa1-ff3e-57febd3b217f@gmx.at>
 <Y67X5JrnRxYN/pns@black.fi.intel.com>
 <00dbeaf9-4d2c-3e3a-fa39-4c232b3a68e6@gmx.at>
 <Y7K7zLoAQVyv0zD5@black.fi.intel.com>
 <011df027-5381-1e10-9c54-e0935ae549f9@gmx.at>
 <Y7ME7EwduIQE38+2@black.fi.intel.com>
Content-Language: en-US
From:   =?UTF-8?Q?Christian_Schaubschl=c3=a4ger?= 
        <christian.schaubschlaeger@gmx.at>
In-Reply-To: <Y7ME7EwduIQE38+2@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZjAA9cdhfe2AWhM7mCHlv6IelZ/NsS1M+WXCd38hSLP1ac96Spq
 wbeix6fR8uGQ640gChF86LP8E/owvou2N4nQDauNgzgc1rOmYKyHYh0P5gWLj7LctQKpYYs
 XVbQnwihl0NxF0W+cKNRv/kCog7EYh1EZ0vfBXJG89+zLd92itPz2pUwsNNGaaWmtoKG4cn
 Ny/g2V7442/+FfxqI/pag==
UI-OutboundReport: notjunk:1;M01:P0:hCc7sJeRrfo=;w4OBLrpV0QyKRdxyPMS/PY3CKif
 HXPc+GsSYrk0j63nfmmRb55M/Cljmq3xDLoD2wlyTD00s7lGZBgYwwxkmzJARloG3yxhVjBFg
 tLnbD5NYQRABELGbmJ+H9ZAmEWUcfQvVSgMd1U8YeOi+y/OJlC7+iycYkm8LLjmYrKWuhwAm4
 zw28IaxTjV4nFrXw5TDfLOidIgB8SCBxbRne4K9YXHSwlS6+TgUx1j1GYNy/6ifX4G+/NzDNg
 65I9H/3g8MmFahjxl1jhSXxfNSFYm12N0qN7iV4Qzu+sXfn/i/co52XhIWd+TDaAwnvEfK0tR
 W5iMq7p9KOVpqPAZZZ/Tu2cj61l9oPkBOUNpTUokaTBY2GsnNCH5M5z4Daip6sJY+9VPzG4D8
 mg7EdSMWt74Gfr60o4dCcttoQcCSTs3hLueI3XqUThHsoSPb7e2jZKhTxUv0EXkRKKyVdBekk
 jTvasrR20j+gcX+Y5xQ2V9v9a6vcT639xeeJf2Zt10xo4hIAcYgXrOWSrIAd97achzp4zG3Vp
 U0XzdXcF975iwtton6PsZzBYTM6Xkf7mphAbVn0AEBtlkvpqLgcRCLk57LiVpjoL/kXXgYY7I
 nZ9tTspDcPXqFCKF2Ioosh/mI2ZTFXqVzudAwzIJODNTWaWPmcw4VJD+tMV3E4FmBylR/MZ0l
 rUOB7OTZ5te4tqUoMczDplRI9PCwzupc8QzzP9xTAbpYnJJoP5lEzxLWNCVlSkuLHJdDY17e+
 N/vqfHOXGcDHXg++CCbevIFurCivzgIbR0/wpJKdHa+OrD6SsTSDsEPCceHuT3Gi9ACcPuPjU
 +/OGB11mC4Hc3mOUQ11ZZYf/Yb+Ewl9mwl6wv+kYK576yHJgkQaw1jcrZ1qfCbadxTpfCaE/U
 PboVTk8IcCzwhteJB51kVCltU7gFqjR2Xh+aAhkaFiv1dB8pb4EzoU+95aqi2yfQKbPhY8CGK
 zvRlR0Pb8gmRMBpDy5taq7LZxZc=
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Good morning,

> Can you try the below hack? It should tear down all tunnels during
> reboot so the firmware should see pristine path configuration spaces
> (assuming it is looking at them and failing because if already configure
> paths).
>
> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> index 1711dc19b1e2..e0544843e242 100644
> --- a/drivers/thunderbolt/tb.c
> +++ b/drivers/thunderbolt/tb.c
> @@ -1982,13 +1982,7 @@ static void tb_stop(struct tb *tb)
>  	cancel_delayed_work(&tcm->remove_work);
>  	/* tunnels are only present after everything has been initialized */
>  	list_for_each_entry_safe(tunnel, n, &tcm->tunnel_list, list) {
> -		/*
> -		 * DMA tunnels require the driver to be functional so we
> -		 * tear them down. Other protocol tunnels can be left
> -		 * intact.
> -		 */
> -		if (tb_tunnel_is_dma(tunnel))
> -			tb_tunnel_deactivate(tunnel);
> +		tb_tunnel_deactivate(tunnel);
>  		tb_tunnel_free(tunnel);
>  	}
>  	tb_switch_remove(tb->root_switch);
That doesn't change the behaviour unfortunately.

I did find out two (confusing) things, though. The network interface on th=
e dock is an Intel I255-LMvP, in linux it's eth1. When I do this before th=
e reboot:

echo 1 > /sys/class/net/eth1/device/remove

the device is removed and then added again immedidately:

[=C2=A0=C2=A0 31.930950] IPv6: ADDRCONF(NETDEV_CHANGE): eth1: link becomes=
 ready
[=C2=A0=C2=A0 77.496059] igc 0000:2c:00.0 eth1: PHC removed
[=C2=A0=C2=A0 77.670531] pci 0000:2c:00.0: Removing from iommu group 21
[=C2=A0=C2=A0 78.551553] pci 0000:2c:00.0: [8086:5502] type 00 class 0x020=
000
[=C2=A0=C2=A0 78.552412] pci 0000:2c:00.0: reg 0x10: [mem 0x00000000-0x000=
fffff]
[=C2=A0=C2=A0 78.553194] pci 0000:2c:00.0: reg 0x1c: [mem 0x00000000-0x000=
03fff]
[=C2=A0=C2=A0 78.554128] pci 0000:2c:00.0: PME# supported from D0 D3hot D3=
cold
[=C2=A0=C2=A0 78.555110] pci 0000:2c:00.0: Adding to iommu group 21
[=C2=A0=C2=A0 78.555913] pcieport 0000:04:04.0: ASPM: current common clock=
 configuration is inconsistent, reconfiguring
[=C2=A0=C2=A0 78.566265] pci_bus 0000:05: Allocating resources
[=C2=A0=C2=A0 78.566285] pci_bus 0000:2c: Allocating resources
[=C2=A0=C2=A0 78.566296] pci 0000:2c:00.0: BAR 0: assigned [mem 0x82000000=
-0x820fffff]
[=C2=A0=C2=A0 78.567075] pci 0000:2c:00.0: BAR 3: assigned [mem 0x82100000=
-0x82103fff]
[=C2=A0=C2=A0 78.567862] igc 0000:2c:00.0: enabling device (0000 -> 0002)
[=C2=A0=C2=A0 78.568671] igc 0000:2c:00.0: PTM enabled, 4ns granularity
[=C2=A0=C2=A0 78.626297] pps pps0: new PPS source ptp1
[=C2=A0=C2=A0 78.627161] igc 0000:2c:00.0 (unnamed net_device) (uninitiali=
zed): PHC added
[=C2=A0=C2=A0 78.653444] igc 0000:2c:00.0: 4.000 Gb/s available PCIe bandw=
idth (5.0 GT/s PCIe x1 link)
[=C2=A0=C2=A0 78.654448] igc 0000:2c:00.0 eth1: MAC: 5c:60:ba:71:ea:be
[=C2=A0=C2=A0 78.655307] pci_bus 0000:05: Allocating resources
[=C2=A0=C2=A0 78.655327] pci_bus 0000:2c: Allocating resources
[=C2=A0=C2=A0 81.598703] igc 0000:2c:00.0 eth1: NIC Link is Up 1000 Mbps F=
ull Duplex, Flow Control: RX/TX
[=C2=A0=C2=A0 81.599729] IPv6: ADDRCONF(NETDEV_CHANGE): eth1: link becomes=
 ready


If I reboot now, I can see the network interface in the firmware!

And now for the confusing part: I do exactly the same steps as above, but =
whith an external display connected to the dock. Even if I don't touch thi=
s display in Linux (the i915 driver isn't loaded, just efi framebuffer), t=
hen the net interface is gone in the firmware after the reboot...

Also, after the

echo 1 > /sys/class/net/eth1/device/remove


the device doesn't show up in linux again:

[=C2=A0=C2=A0 10.158596] IPv6: ADDRCONF(NETDEV_CHANGE): eth1: link becomes=
 ready
[=C2=A0=C2=A0 42.773958] igc 0000:2c:00.0 eth1: PHC removed
[=C2=A0=C2=A0 42.962208] pci 0000:2c:00.0: Removing from iommu group 21


I'm not sure if this is some weird coincidence or if it can help to bring =
ligth to this issue...

Thanks and best regards,
Christian

