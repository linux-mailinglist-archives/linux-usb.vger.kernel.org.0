Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 926763331C1
	for <lists+linux-usb@lfdr.de>; Tue,  9 Mar 2021 23:52:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230325AbhCIWvi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 9 Mar 2021 17:51:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230122AbhCIWvO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 9 Mar 2021 17:51:14 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66F3DC06174A
        for <linux-usb@vger.kernel.org>; Tue,  9 Mar 2021 14:51:13 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id n16so30097577lfb.4
        for <linux-usb@vger.kernel.org>; Tue, 09 Mar 2021 14:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=PRL7j+1qImUZXHF1sSVAoJhEN9gadGf8W6lLmTYYYjI=;
        b=seDG5I4utf21tnszdAFHJknGFxyWFFpk7rX1XDB5hPekla5UgMxECL+ZyJjF62IsLs
         nvYQ49V511+qLL3em7IuAz2r+tGTrcmeHnQycZ0BSYe8azX4dslX6f9g/AhbmnhNvdxi
         YnxMNrgE8MqyObCTJKsRiNJDopmyESlo0N+lJDuEDzbk/jZwnSLOY70IksL/9/MVMgnM
         y1kMeDjaH38RwT5Y4ovUJQhx0lkSBcye0jVOkI9Oem4aA/RF/2+lr/37ZByM4ckzf60h
         sJmzpuXRLo5f1rfqOuD5TNIK9FmL0XvbpHiG62hXBFuXo+6CCfJN4PZNw/GKinaE0uhY
         SfUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=PRL7j+1qImUZXHF1sSVAoJhEN9gadGf8W6lLmTYYYjI=;
        b=c6tmZuIdMd8xmjbo8zm+x+XWpf0jMIcJcnikdTQz4hhOORQoM+bZnuPgHWl/5CpRks
         2nMkWjifYeFmttrg+ISxmRyNEivM3m5DYReqgka6bOYjWll02NResfnJiwVbUhqayYlU
         JXqfhpSPMP8PjcyduonlMgV8jAkcYOejC8DX3BrVydigoG+vbiQg1baVKjIMZOmRpISV
         eTxbpM9rdkII+4jWStX9913Nr7+EdLTF8hbDvfggzXtFu+vTXf27wZtcJtKPOUPra9VC
         HQl5zz/Owsbhz5Oo6LBS4w2mFIVQk5S80hV8D7xZPt2L8zq/wijv6owLR3b+UlxtejXu
         WN1w==
X-Gm-Message-State: AOAM530SXL5B06dIL3fQHVH/ij5DI0tg7ELnJ/4Ru5fVdjkfC5QLJv4w
        dKkGE5pIq2/CJP1lwCqn2TF25MWwwARd6365lIo=
X-Google-Smtp-Source: ABdhPJzj8MNl5WLWV/c7tOXsTy7E2AVFaIP5sxNpGDWfYh6oln3KJcrhUaOYAhwXbV1GJ0x1ee5yzMVr7/HN058U3ns=
X-Received: by 2002:a05:6512:3226:: with SMTP id f6mr158535lfe.171.1615330271787;
 Tue, 09 Mar 2021 14:51:11 -0800 (PST)
MIME-Version: 1.0
References: <CAKRa1U6rukBBwWx0vN2wqiHMbUH9zWsc-y1wknOCvhueqWsT7w@mail.gmail.com>
 <221f3bec-e1cc-0b03-6860-c8660d72185a@synopsys.com> <f5bca159-e8de-3c76-c2b4-6f4efa001fd9@linux.intel.com>
In-Reply-To: <f5bca159-e8de-3c76-c2b4-6f4efa001fd9@linux.intel.com>
From:   William Allen <william.allentx@gmail.com>
Date:   Tue, 9 Mar 2021 16:51:00 -0600
Message-ID: <CAKRa1U6Eb2jt1dzgNTsrgzL=uBKaHRTs70aLAa4i=CADvO+C1w@mail.gmail.com>
Subject: Re: USB 3.2 Gen 2x2 "Superspeed+20GBps" support for ASM3242
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Thank you! I tested your patches and got a little bit of success. The
dmesg output now shows the drive connecting at SuperSpeedPlus Gen 2,
which is inline with the 5.11.2-arch1-1 kernel, but shows the same
failure messages, except under the "scsi" facility, rather than the
"ses" facility


5.12.0-rc2-next-20210309-2-next-git (manually added your patches to
the PKGBUILD file)
-------------------------------------------------
usb 5-1: new SuperSpeedPlus Gen 2 USB device number 2 using xhci_hcd
usb 5-1: New USB device found, idVendor=3D1058, idProduct=3D2642, bcdDevice=
=3D10.03
usb 5-1: New USB device strings: Mfr=3D2, Product=3D3, SerialNumber=3D1
usb 5-1: Product: Game Drive
usb 5-1: Manufacturer: Western Digital
usb 5-1: SerialNumber: 323130334431343030303736
scsi host12: uas
scsi 12:0:0:0: Direct-Access     WD       Game Drive       1003 PQ: 0 ANSI:=
 6
scsi 12:0:0:1: Enclosure         WD       SES Device       1003 PQ: 0 ANSI:=
 6
sd 12:0:0:0: [sdi] 3907029168 512-byte logical blocks: (2.00 TB/1.82 TiB)
sd 12:0:0:0: [sdi] Write Protect is off
sd 12:0:0:0: [sdi] Mode Sense: 57 00 10 00
sd 12:0:0:0: [sdi] Write cache: enabled, read cache: enabled, supports
DPO and FUA
sd 12:0:0:0: [sdi] Optimal transfer size 33553920 bytes
scsi 12:0:0:1: Failed to get diagnostic page 0x1
scsi 12:0:0:1: Failed to bind enclosure -19
sd 12:0:0:0: [sdi] Attached SCSI disk
ses 12:0:0:1: Attached Enclosure device


The drive also now connects at 10000M, whereas before it was
connecting at 5000M.
I still am not seeing anything relating to Gen 2x2 speeds.


I checked the listed lanes, which IS showing new information. Value of:
/sys/bus/usb/devices/usb5/rx_lanes =3D 2
/sys/bus/usb/devices/usb5/tx_lanes =3D 2


Here is the output of lsusb -vvv for the device:
-------------------------------------------------
Bus 005 Device 002: ID 1058:2642 Western Digital Technologies, Inc. Game Dr=
ive
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               3.20
  bDeviceClass            0
  bDeviceSubClass         0
  bDeviceProtocol         0
  bMaxPacketSize0         9
  idVendor           0x1058 Western Digital Technologies, Inc.
  idProduct          0x2642
  bcdDevice           10.03
  iManufacturer           2 Western Digital
  iProduct                3 Game Drive
  iSerial                 1 323130334431343030303736
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0079
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0
    bmAttributes         0x80
      (Bus Powered)
    MaxPower              896mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass         8 Mass Storage
      bInterfaceSubClass      6 SCSI
      bInterfaceProtocol     80 Bulk-Only
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x02  EP 2 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       1
      bNumEndpoints           4
      bInterfaceClass         8 Mass Storage
      bInterfaceSubClass      6 SCSI
      bInterfaceProtocol     98
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
        MaxStreams             32
        Data-in pipe (0x03)
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x02  EP 2 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
        MaxStreams             32
        Data-out pipe (0x04)
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
        MaxStreams             32
        Status pipe (0x02)
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x04  EP 4 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst               0
        Command pipe (0x01)
Binary Object Store Descriptor:
  bLength                 5
  bDescriptorType        15
  wTotalLength       0x002a
  bNumDeviceCaps          3
  USB 2.0 Extension Device Capability:
    bLength                 7
    bDescriptorType        16
    bDevCapabilityType      2
    bmAttributes   0x0000f41e
      BESL Link Power Management (LPM) Supported
    BESL value     1024 us
    Deep BESL value    61440 us
  SuperSpeed USB Device Capability:
    bLength                10
    bDescriptorType        16
    bDevCapabilityType      3
    bmAttributes         0x00
    wSpeedsSupported   0x000e
      Device can operate at Full Speed (12Mbps)
      Device can operate at High Speed (480Mbps)
      Device can operate at SuperSpeed (5Gbps)
    bFunctionalitySupport   1
      Lowest fully-functional device speed is Full Speed (12Mbps)
    bU1DevExitLat          10 micro seconds
    bU2DevExitLat        2047 micro seconds
  SuperSpeedPlus USB Device Capability:
    bLength                20
    bDescriptorType        16
    bDevCapabilityType     10
    bmAttributes         0x00000001
      Sublink Speed Attribute count 1
      Sublink Speed ID count 0
    wFunctionalitySupport   0x1100
    bmSublinkSpeedAttr[0]   0x000a4030
      Speed Attribute ID: 0 10Gb/s Symmetric RX SuperSpeedPlus
    bmSublinkSpeedAttr[1]   0x000a40b0
      Speed Attribute ID: 0 10Gb/s Symmetric TX SuperSpeedPlus
can't get debug descriptor: Resource temporarily unavailable
Device Status:     0x0000
  (Bus Powered)


And here is output of lspci relating to the ASM3242:
-------------------------------------------------
04:00.0 USB controller: ASMedia Technology Inc. ASM3242 USB 3.2 Host
Controller (prog-if 30 [XHCI])
     Subsystem: ASMedia Technology Inc. ASM3242 USB 3.2 Host Controller
     Physical Slot: 1
     Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
ParErr+ Stepping- SERR- FastB2B- DisINTx+
     Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
     Latency: 0, Cache Line Size: 64 bytes
     Interrupt: pin A routed to IRQ 62
     Region 0: Memory at f7df0000 (64-bit, non-prefetchable) [size=3D32K]
     Capabilities: [50] MSI: Enable- Count=3D1/8 Maskable- 64bit+
          Address: 0000000000000000  Data: 0000
     Capabilities: [68] MSI-X: Enable+ Count=3D8 Masked-
          Vector table: BAR=3D0 offset=3D00002000
          PBA: BAR=3D0 offset=3D00002080
     Capabilities: [78] Power Management version 3
          Flags: PMEClk- DSI- D1- D2- AuxCurrent=3D55mA
PME(D0+,D1-,D2-,D3hot+,D3cold+)
          Status: D0 NoSoftRst+ PME-Enable- DSel=3D0 DScale=3D0 PME-
     Capabilities: [80] Express (v2) Legacy Endpoint, MSI 00
          DevCap:   MaxPayload 512 bytes, PhantFunc 0, Latency L0s
<64ns, L1 <2us
               ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
          DevCtl:   CorrErr- NonFatalErr+ FatalErr+ UnsupReq-
               RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
               MaxPayload 256 bytes, MaxReadReq 4096 bytes
          DevSta:   CorrErr+ NonFatalErr- FatalErr- UnsupReq+ AuxPwr+ Trans=
Pend-
          LnkCap:   Port #0, Speed 8GT/s, Width x4, ASPM L1, Exit
Latency L1 unlimited
               ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
          LnkCtl:   ASPM Disabled; RCB 64 bytes, Disabled- CommClk+
               ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
          LnkSta:   Speed 8GT/s (ok), Width x4 (ok)
               TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
          DevCap2: Completion Timeout: Range A, TimeoutDis- NROPrPrP- LTR+
                10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt+
EETLPPrefix-
                EmergencyPowerReduction Not Supported,
EmergencyPowerReductionInit-
                FRS-
                AtomicOpsCap: 32bit- 64bit- 128bitCAS-
          DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR-
OBFF Disabled,
                AtomicOpsCtl: ReqEn-
          LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink-
Retimer- 2Retimers- DRS-
          LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-
                Transmit Margin: Normal Operating Range,
EnterModifiedCompliance- ComplianceSOS-
                Compliance De-emphasis: -6dB
          LnkSta2: Current De-emphasis Level: -6dB,
EqualizationComplete+ EqualizationPhase1+
                EqualizationPhase2+ EqualizationPhase3+ LinkEqualizationReq=
uest-
                Retimer- 2Retimers- CrosslinkRes: unsupported
     Capabilities: [c0] Subsystem: ASMedia Technology Inc. Device 0201
     Capabilities: [100 v1] Advanced Error Reporting
          UESta:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
RxOF- MalfTLP- ECRC- UnsupReq+ ACSViol-
          UEMsk:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
RxOF- MalfTLP- ECRC- UnsupReq+ ACSViol-
          UESvrt:   DLP- SDES+ TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
          CESta:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalE=
rr+
          CEMsk:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalE=
rr-
          AERCap:   First Error Pointer: 00, ECRCGenCap+ ECRCGenEn-
ECRCChkCap- ECRCChkEn-
               MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
          HeaderLog: 00000000 00000000 00000000 00000000
     Capabilities: [200 v1] Secondary PCI Express
          LnkCtl3: LnkEquIntrruptEn- PerformEqu-
          LaneErrStat: LaneErr at lane: 0 1 2 3
     Capabilities: [300 v1] Latency Tolerance Reporting
          Max snoop latency: 0ns
          Max no snoop latency: 0ns
     Capabilities: [400 v1] L1 PM Substates
          L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
L1_PM_Substates+
                 PortCommonModeRestoreTime=3D0us PortTPowerOnTime=3D10us
          L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
                  T_CommonMode=3D0us LTR1.2_Threshold=3D0ns
          L1SubCtl2: T_PwrOn=3D0us
     Kernel driver in use: xhci_hcd
     Kernel modules: xhci_pci

On Tue, Mar 9, 2021 at 6:00 AM Mathias Nyman
<mathias.nyman@linux.intel.com> wrote:
>
> On 9.3.2021 9.27, Thinh Nguyen wrote:
> > + Mathias
> >
> > Hi,
> >
> > William Allen wrote:
> >> I've never submitted to the mailing list before, so please excuse any
> >> formalities that I may not be observing.
> >> I would like to be able to use USB 3.2 Gen2x2 "SuperSpeed+=C2=B2=E2=81=
=B0Gbps"
> >> under Linux. I've tried several different kernel versions, and have
> >> built the kernel from the usb-next tree. All without finding proper
> >> functionality.
> >>
> >> I have an Ableconn PEX-UB159 USB 3.2 Gen 2x2 PCIe expansion card, with
> >> the ASM3242 controller. This controller appears to be the only Gen2x2
> >> capable controller that exists in commercial products- so far as I've
> >> found. Everything appears to work, except for "SuperSpeed+=C2=B2=E2=81=
=B0Gbps" when
> >> I plug in a capable device.
> >> Here is the dmesg output as soon as I plug in a Gen2x2 WD P50 Black
> >> External NVMe SSD, using an appropriate SuperSpeed+=C2=B2=E2=81=B0Gbps=
 certified
> >> cable:
> >> 5.11.2-arch1-1
> >> --------------------
> >> usb 7-2: new SuperSpeedPlus Gen 2 USB device number 3 using xhci_hcd
> >> usb 7-2: New USB device found, idVendor=3D1058, idProduct=3D2642, bcdD=
evice=3D10.03
> >> usb 7-2: New USB device strings: Mfr=3D2, Product=3D3, SerialNumber=3D=
1
> >> usb 7-2: Product: Game Drive
> >> usb 7-2: Manufacturer: Western Digital
> >> usb 7-2: SerialNumber: 323130334431343030303736
> >> scsi host11: uas
> >> scsi 11:0:0:0: Direct-Access     WD       Game Drive       1003 PQ: 0 =
ANSI: 6
> >> scsi 11:0:0:1: Enclosure         WD       SES Device       1003 PQ: 0 =
ANSI: 6
> >> sd 11:0:0:0: [sdf] 3907029168 512-byte logical blocks: (2.00 TB/1.82 T=
iB)
> >> sd 11:0:0:0: [sdf] Write Protect is off
> >> sd 11:0:0:0: [sdf] Mode Sense: 57 00 10 00
> >> sd 11:0:0:0: [sdf] Write cache: enabled, read cache: enabled, supports
> >> DPO and FUA
> >> sd 11:0:0:0: [sdf] Optimal transfer size 33553920 bytes
> >> sd 11:0:0:0: [sdf] Attached SCSI disk
> >>
> >>  When I saw commits referring to Gen2x2 in the usb-next repo, I built
> >> off that, and also ran linux-next-git.r0.gabaf6f60176f-1 from AUR,
> >> both giving me the same results/output:
> >> linux-next-git.r0.gabaf6f60176f-1
> >> ----------------------------------------------
> >> usb 5-1: new SuperSpeed Gen 1x2 USB device number 3 using xhci_hcd
> >> usb 5-1: New USB device found, idVendor=3D1058, idProduct=3D2642, bcdD=
evice=3D10.03
> >> usb 5-1: New USB device strings: Mfr=3D2, Product=3D3, SerialNumber=3D=
1
> >> usb 5-1: Product: Game Drive
> >> usb 5-1: Manufacturer: Western Digital
> >> usb 5-1: SerialNumber: 323130334431343030303736
> >> scsi host7: uas
> >> scsi 7:0:0:0: Direct-Access     WD       Game Drive       1003 PQ: 0 A=
NSI: 6
> >> scsi 7:0:0:1: Enclosure         WD       SES Device       1003 PQ: 0 A=
NSI: 6
> >> ses 7:0:0:1: Attached Enclosure device
> >> ses 7:0:0:1: Failed to get diagnostic page 0x1
> >> ses 7:0:0:1: Failed to bind enclosure -19
> >> sd 7:0:0:0: [sdf] 3907029168 512-byte logical blocks: (2.00 TB/1.82 Ti=
B)
> >> sd 7:0:0:0: [sdf] Write Protect is off
> >> sd 7:0:0:0: [sdf] Mode Sense: 57 00 10 00
> >> sd 7:0:0:0: [sdf] Write cache: enabled, read cache: enabled, supports
> >> DPO and FUA
> >> sd 7:0:0:0: [sdf] Optimal transfer size 33553920 bytes
> >> sd 7:0:0:0: [sdf] Attached SCSI disk
> >>
> >> See that it's detecting it as Gen 1x2.
> >> The output of lsusb -t shows that it is connected at 5000M using the
> >> uas driver. Even my much slower USB 3.1 SSDs connect at 10000M on the
> >> exact same port.
> >> When I attach the Gen2x2 NVMe SSD to my other 3.2 Gen2 card, it
> >> connects at 10000M, so It seems to be directly related to a
> >> mishandling when the Gen2x2 device gets recognized by the Gen2x2 card.
> >>
> >> lspci output from 5.11.2-arch1-1:
> >> -------------------------------------------
> >> USB controller: ASMedia Technology Inc. ASM3242 USB 3.2 Host
> >> Controller (prog-if 30 [XHCI])
> >> Subsystem: ASMedia Technology Inc. ASM3242 USB 3.2 Host Controller
> >> Physical Slot: 1
> >> Flags: bus master, fast devsel, latency 0, IRQ 62, NUMA node 0
> >> Memory at f7df0000 (64-bit, non-prefetchable) [size=3D32K]
> >> Capabilities: [50] MSI: Enable- Count=3D1/8 Maskable- 64bit+
> >> Capabilities: [68] MSI-X: Enable+ Count=3D8 Masked-
> >> Capabilities: [78] Power Management version 3
> >> Capabilities: [80] Express Legacy Endpoint, MSI 00
> >> Capabilities: [c0] Subsystem: ASMedia Technology Inc. Device 0201
> >> Capabilities: [100] Advanced Error Reporting
> >> Capabilities: [200] Secondary PCI Express
> >> Capabilities: [300] Latency Tolerance Reporting
> >> Capabilities: [400] L1 PM Substates
> >> Kernel driver in use: xhci_hcd
> >> Kernel modules: xhci_pci
> >>
> >> I'm happy to test anything, or file this somewhere more appropriate if
> >> you could point me in the right direction.
> >
> > Currently the usb host stack doesn't really support USB 3.2 yet, at
> > least the speed check part. I made some updates to handle that.
> >
> > You apply these patches and test on your setup
> > https://patchwork.kernel.org/project/linux-usb/list/?series=3D427561
> >
> > Hopefully Mathias will have time to review and Ack them for the next
> > release cycle.
>
> Thanks for the reminder, added some comments to the series
>
> -Mathias
>
