Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25F4846792
	for <lists+linux-usb@lfdr.de>; Fri, 14 Jun 2019 20:32:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725886AbfFNScW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 Jun 2019 14:32:22 -0400
Received: from mail-pf1-f177.google.com ([209.85.210.177]:33187 "EHLO
        mail-pf1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725809AbfFNScV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 14 Jun 2019 14:32:21 -0400
Received: by mail-pf1-f177.google.com with SMTP id x15so1956732pfq.0
        for <linux-usb@vger.kernel.org>; Fri, 14 Jun 2019 11:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=HGCoVIRjEmqG61oMegqr7r3yd4XZdAs4EdJ3aivpW/k=;
        b=T71CzyYaR5pPS04+6iy/aty4COZvz5D3FigaZfxnx/a4+niAebs8C9JoDjNhxvzYQo
         y/sxd5aWLUFqogYhj1lqnjlIQnDk9Ac5Z3Cohbg6Vls1i7kqNWng/T3ZKpWbrgUTy7AN
         1oOSVSfzfF1vXMGwB2FRmNmKFTu1gnmWUcEe7LOMcF8ewKmcjfA9TSF9r5wB3QWu49PP
         ZB0C/CWSP+L+wjahV7ilcefr/cAuENLu2Tj01i2f1GAslHWrii/dK5D6Pk+aW65ZhZml
         cQAoPaqXjpp7oA2Oqz/qxBEIPKqkWbbMHgL6aRICnd4Ycojk5k3y3ofsvNLUfNpnya1Y
         Sw6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=HGCoVIRjEmqG61oMegqr7r3yd4XZdAs4EdJ3aivpW/k=;
        b=HmhSH3AXHjvIdAeAmtCTUyXilvF1vGd5HZWFlpHXJTMf/h7j90Hql++VglaV59lLps
         gTumcuZiQDwswjbYn3csj+9WzW9SHybZeLORS0gLd7JP22mjM5Mgy2663jq4UyWPzhVN
         LTXcoFlmrfyEdL/XF0Pygq5yJ3ue+/mNTaIx41M5Z9D+YWbR6imil3ERpC0+R1jLWuBk
         bCVPPDRd6it0me9RAqF+I9qsCJfaOCWRahlt/fBH0DjeO4mGpUu+ZmQtyjy3Is3aJpY2
         1lUULlaPz3E4Gc2vFg9pazhW7m7UXw1ET4v2kgZ788iF4I2v31rfo6Gu2nkGACPNrMAz
         hcmA==
X-Gm-Message-State: APjAAAUv/un3zjfNk2Eurzvqd7lFOuISXQNqrgZLhSBc2FWnhFqYSvIF
        40z0MSJo6ZIIETxQ2zRLG3i+
X-Google-Smtp-Source: APXvYqwItCJJYwfaLZG36WF148Qa910FBc1J9QhPVpAA/wYK8gaAM9gDUPT6Ii1KFJGtGPQ/9p73jg==
X-Received: by 2002:a17:90a:1904:: with SMTP id 4mr12893672pjg.116.1560537140466;
        Fri, 14 Jun 2019 11:32:20 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:997:5d95:bdd9:1134:3bdd:7ab4])
        by smtp.gmail.com with ESMTPSA id j2sm3370153pgq.13.2019.06.14.11.32.16
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Jun 2019 11:32:19 -0700 (PDT)
Date:   Sat, 15 Jun 2019 00:02:13 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-actions@lists.infradead.org,
        afaerber@suse.de
Subject: DWC3 USB hub issue
Message-ID: <20190614183213.GB29654@Mani-XPS-13-9360>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

I'm trying to upstream Designware USB3 host driver present in the Actions
Semi S900 SoC. It can successfully detect the USB hub but when any of the
USB device got plugged in, it fails with following error:

[    4.365566] usb usb1-port1: connect-debounce failed

Full log can be found here: https://pastebin.ubuntu.com/p/PNff5fZkn6/

Below is the output of, lsusb -v:

Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               3.00
  bDeviceClass            9 Hub
  bDeviceSubClass         0 Unused
  bDeviceProtocol         3 
  bMaxPacketSize0         9
  idVendor           0x1d6b Linux Foundation
  idProduct          0x0003 3.0 root hub
  bcdDevice            5.02
  iManufacturer           3 Linux 5.2.0-rc3-00032-gbd970cfc7a82-dirty xhci-hcd
  iProduct                2 xHCI Host Controller
  iSerial                 1 xhci-hcd.0.auto
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength           31
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0 
    bmAttributes         0xe0
      Self Powered
      Remote Wakeup
    MaxPower                0mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         9 Hub
      bInterfaceSubClass      0 Unused
      bInterfaceProtocol      0 Full speed (or root) hub
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0004  1x 4 bytes
        bInterval              12
        bMaxBurst               0
Hub Descriptor:
  bLength              12
  bDescriptorType      42
  nNbrPorts             1
  wHubCharacteristic 0x000a
    No power switching (usb 1.0)
    Per-port overcurrent protection
  bPwrOn2PwrGood       10 * 2 milli seconds
  bHubContrCurrent      0 milli Ampere
  bHubDecLat          0.0 micro seconds
  wHubDelay             0 nano seconds
  DeviceRemovable    0x00
 Hub Port Status:
   Port 1: 0000.02a0 5Gbps power Rx.Detect
Binary Object Store Descriptor:
  bLength                 5
  bDescriptorType        15
  wTotalLength           15
  bNumDeviceCaps          1
  SuperSpeed USB Device Capability:
    bLength                10
    bDescriptorType        16
    bDevCapabilityType      3
    bmAttributes         0x02
      Latency Tolerance Messages (LTM) Supported
    wSpeedsSupported   0x0008
      Device can operate at SuperSpeed (5Gbps)
    bFunctionalitySupport   3
      Lowest fully-functional device speed is SuperSpeed (5Gbps)
    bU1DevExitLat           0 micro seconds
    bU2DevExitLat           0 micro seconds
Device Status:     0x0001
  Self Powered

Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub

Devicetree snippet:

                usbdrd3_0: usb@e0400000 {
                        compatible = "actions,s900-dwc3";
                        clocks = <&cmu CLK_USB3_480MPLL0>,
                                 <&cmu CLK_USB3_480MPHY0>,
                                 <&cmu CLK_USB3_5GPHY>,
                                 <&cmu CLK_USB3_CCE>,
                                 <&cmu CLK_USB3_MAC>;
                        clock-names = "usb3_480mpll0", "usb3_480mphy0",
                                      "usb3_5gphy", "usb3_cce",
                                      "usb3_mac";
                        resets  = <&cmu RESET_USB3>;
                        reset-names = "usb3";
                        power-domains = <&sps S900_PD_USB3>;
                        #address-cells = <2>;
                        #size-cells = <2>;
                        ranges;

                        usbdrd_dwc3_0: dwc3 {
                                compatible = "snps,dwc3";
                                reg = <0x0 0xe0400000 0x0 0x100000>;
                                interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
                                usb-phy = <&usb2_phy>, <&usb3_phy>;
                                dr_mode = "host";
                                power-domains = <&sps S900_PD_USB3>;
                                snps,hsphy_interface = "utmi";
                        };
                };

After going through the mailing list looking for similar issue, found that
some host controllers works with following quirk:

snps,dis_u3_susphy_quirk;

I tried that also but it didn't work. Can anyone shed some light on this?

PS: USB3 is working fine with vendor kernel 3.10.

Thanks,
Mani
