Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FB662EC1DC
	for <lists+linux-usb@lfdr.de>; Wed,  6 Jan 2021 18:15:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726581AbhAFROn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 Jan 2021 12:14:43 -0500
Received: from mail-eopbgr100084.outbound.protection.outlook.com ([40.107.10.84]:9504
        "EHLO GBR01-LO2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726468AbhAFROm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 6 Jan 2021 12:14:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aiq/ZEyofGL331E+XhZtwBVBOFLBLika58mR1emeeA6PG8Tgg5/joLxzkklEh3Zl/r1Lcu5rzHHklZeNihhGXdovnfUK+xYXH8XyZ0+ry1JQ3rdjqQ52VHHqMWu5pJbnXb9YKxMxHAS7sPM1oj29kI1Usfw27+idW8A6mYwxK65sKklb9XRq+rKe1ytrcyHzdNP5c3UBnjp/szJaWNTeIEzj7kNPr2Qlrs3tmN+mgyEo9ZYbzQRv465y99Lysz7ofxeG6JtH+ER7IPrGSNIjneNj8imNuwrDYe4MKywAHSbJjSY9come54QJbLs3CxNnJkbz7kgWDShfvdY7k080/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=77l5V9EbxF04ceBik1pOOADGRQOIYYo5BrzTSgj1kU8=;
 b=DCoQgkG36102eXqViYzM8c40EVH8tcz5ZculiQGC3ehl0AIVsX9Nle/g342X9kX3Z5qoHlK0qp6ntgqmZNv9cc6wjkCd9cIsDUg3Bsc0R9lRtTB20B/vodykGYiPNfgeROMBK7xZyxkLUczyzbwkFtckdp3TF4vaW5gEq344UI2H1ZLVwBuWM8iRMkVqR3LzBO/yFmvO8mitdQxQw250sF7ePniWFheCNhzkyl8UEI7eXcHfHWtcSeiKW8CWwPS+Gn+WUS2m1ya8c66/daNg88OlTNKj7PyGWt6OruDgdZrUemvgMsO/rvi1rb2/D3429mfnoQrgzY10yMyIOI2aiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=davidmytton.co.uk; dmarc=pass action=none
 header.from=davidmytton.co.uk; dkim=pass header.d=davidmytton.co.uk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=davidmytton.co.uk;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=77l5V9EbxF04ceBik1pOOADGRQOIYYo5BrzTSgj1kU8=;
 b=c7wCeG8iUtf3LzHP1wqTlxHPai2xnTbIVzAytq21kfEzjoiYZbVsdlGnhH86W0i8cWYldzwNccjR03BrU71/TOY3Pjz8kXlJ9zYixkrngEA2YCdOmdNc9g4+ZVqhFb9X03rHBcPNMvpxxcbD3tM67JsHnMuswcm2XoOdSukS1L0=
Received: from LO2P123MB1967.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:c5::14)
 by LO2P123MB2462.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:ce::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Wed, 6 Jan
 2021 17:13:51 +0000
Received: from LO2P123MB1967.GBRP123.PROD.OUTLOOK.COM
 ([fe80::1ce8:102f:868e:3429]) by LO2P123MB1967.GBRP123.PROD.OUTLOOK.COM
 ([fe80::1ce8:102f:868e:3429%3]) with mapi id 15.20.3721.024; Wed, 6 Jan 2021
 17:13:51 +0000
From:   David Mytton <david@davidmytton.co.uk>
To:     "nic_swsd@realtek.com" <nic_swsd@realtek.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RTL8153 1G USB ethernet kernel hang bug
Thread-Topic: RTL8153 1G USB ethernet kernel hang bug
Thread-Index: AQHW5E5I0n2VM70CKEOJ1i4J21kmGQ==
Date:   Wed, 6 Jan 2021 17:13:51 +0000
Message-ID: <LO2P123MB19676167DCB923BC8F464AECFDD00@LO2P123MB1967.GBRP123.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: realtek.com; dkim=none (message not signed)
 header.d=none;realtek.com; dmarc=none action=none
 header.from=davidmytton.co.uk;
x-originating-ip: [81.98.160.254]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 49f56bdc-5b0b-49e2-ef68-08d8b2667055
x-ms-traffictypediagnostic: LO2P123MB2462:
x-microsoft-antispam-prvs: <LO2P123MB24623ACE6E910B85750EEC6CFDD00@LO2P123MB2462.GBRP123.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fPKIaXmpX5YVVMzGHRhTx8WjUiN/mbqVPkJJgcAIh9GVmgJSisKTRcl89rSbz1bJddkeAl4EFmIf8HWrEuKNzf8eLtDSdOwtlcPEBYbfOhzqmKtm2DkYVzSh9E5ZZeriaTBvrNNVBRqzzO3ZZ9xXjbl4IcN0UkWbQvS3YxXfHJuDs5fb3+OL2chzYJzYjECRuouO8qO/FuGMCN++o0isQMlYic9HswiwRJo83IvbfycIfFYnNN8Q5lza53KgouGopVcj5I0Ky4TVhxksR4lcY+p6wniVLN3/aILr75tzYY0PL25vsQEZSZhZFyO+R+Rx3Eh4ePfyFrP1F+03tLwyVDWxDtmio9DXccrPXE8hJj3KIAO+WeuFhObiLVvicol3PgSZiQMYsMMU8kWLutnWtbxc8+/VMASdJIPVsVhGmPQuh6SZzOtPKW7ZGkwFvHFYQU+Iz2gzG6eygQeWzYaI8A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P123MB1967.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(396003)(366004)(376002)(39830400003)(316002)(478600001)(6506007)(966005)(8936002)(6916009)(83380400001)(4326008)(5660300002)(9686003)(55016002)(71200400001)(30864003)(86362001)(66556008)(66446008)(66476007)(64756008)(33656002)(76116006)(7696005)(186003)(26005)(52536014)(2906002)(8676002)(66946007)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?o2TzgzZgyWnvZUvSPGJG1L3jhc+K12JIPrCT8yzXLEqlnEV1jPwqEFipi2?=
 =?iso-8859-1?Q?qHC9IyafL4n5v8Ar8KcUWurgdf22PiGIvgPRy3EB4r2C7DsTXemW0Chldd?=
 =?iso-8859-1?Q?Mqe+Nup4X1yrJGmRCTbKkzSmgz5zShOLy8shYXIlWJ3lYQlZqTOk+6CiMF?=
 =?iso-8859-1?Q?+NcoajVgGP0Lc1jKKbOnt0Sy48DLr88JJK5i/DNnNlovXk6cugUf+a6HfZ?=
 =?iso-8859-1?Q?mw7nGmo97Xapu1clhjOkhdemHjG0R9UjZbQBlo7JmyjL0O18vHEFENfgJQ?=
 =?iso-8859-1?Q?dYQEsk/7jAj13c5dRhlgXGLLxZ404/Dwl7E+rWrvYI6JbH81X5G7ya2j8b?=
 =?iso-8859-1?Q?V06Tr0R7umjaRQJVm1jfllZwJYkf8uaGv3nIk0b0iEC2K/oG7jTlljVcza?=
 =?iso-8859-1?Q?bpqYZWQDB71GtzmcG3JYUuPPdWgaoH353IjINDIXdtaMWnfL+4i/1TJwUC?=
 =?iso-8859-1?Q?RPk1zLv6ebgtgGeTLG7Lz+nHTkR39wz7SLGZGkBsD1gChuaJKZQ9eAVcFQ?=
 =?iso-8859-1?Q?Uu2liLVBUE2AdhDooj2vMQrduCi8C3mgGFddyUKZ9X8zXP6OM5oqKmBIHC?=
 =?iso-8859-1?Q?bs6luAj1WNrGNPsjuTDynS+CUroucG6r1O+D3dEg20Hj8rK+eV4UH3lzw7?=
 =?iso-8859-1?Q?8GCmO4Io8kb0m8E3f8Bz3A0URGKenq8emoqBpibJfQnNcPOX2SrhHhHe65?=
 =?iso-8859-1?Q?++9pDjdrq+t20gfHFExwKjDirx4h1zem1635KCLaGgUfqyy5xMuchKe9Yy?=
 =?iso-8859-1?Q?B8TECkPBYqxMdVo+SGng4N0CS7abpyqgzN5jAQMLxx53VD6eY7gYfEjdnn?=
 =?iso-8859-1?Q?jAqUCcL+kYkYCoaRgFxvN51nQ3+WJ1B8abd/DQTHpQZDYufkkPmMwC/NUW?=
 =?iso-8859-1?Q?Coz3Mwo2wpFK5QA6KC2Mil+dP/iTS1HPqlIp6eT4rJ4ClReP0v2oEga+Ds?=
 =?iso-8859-1?Q?R0HaKBkzaaH5ABZ5enkqPWw4vS3TC4GB9dGljtehR+Bnhmw0WxAl2y/nro?=
 =?iso-8859-1?Q?nUsiW7b+c1g5jNYVE=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: davidmytton.co.uk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO2P123MB1967.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 49f56bdc-5b0b-49e2-ef68-08d8b2667055
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2021 17:13:51.3413
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 266dd960-dade-40f1-8186-8b676c5ae3ef
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XqaGW1C+AMvYTzX3hznjYDY+IjmkXv9kfocsix81uMmKxI+7wlhsuffbMruc1L/GWkwdJoVDijLuMySe0NLoNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P123MB2462
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I'd like to report a bug in the Realtek driver for a RTL8153 10/100/1000=0A=
Ethernet adapter built-in to a USB-C connected Philips 272B7QUPBEB 27" QHD =
LCD=0A=
Monitor. It is not limited to the monitor as I have seen other similar repo=
rts of=0A=
USB Ethernet adapters with the same issue using the same driver.=0A=
=0A=
I have reproduced this on Kernel 5.10.2 and 5.9.11, both Manjaro, but have =
seen=0A=
reports across multiple distros.=0A=
=0A=
Symptoms:=0A=
=0A=
- After a period of time following a reboot, ethernet connectivity suddenly=
=0A=
  drops. Wi-Fi might take over, but not reliably.=0A=
- There is a kernel trace in the journalctl output (see below).=0A=
- Attempting to do anything related to the network causes a hang e.g. runni=
ng=0A=
  inxi hangs after CPU output.=0A=
- The only way to recover is to hard reset. reboot command also hangs.=0A=
=0A=
Reproduce steps:=0A=
=0A=
- Reports (below) seem to suggest it is related to throughput, but I am una=
ble to=0A=
  trigger it on demand. Only after a period of usage after reboot ranging f=
rom=0A=
  1-2 hours to up to 24 hours does it happen.=0A=
=0A=
Workaround:=0A=
=0A=
- Set usbcore.autosuspend=3D-1 pci_aspm=3Doff kernel params. This has solve=
d the=0A=
  issue for me; the system has been stable with several days of uptime.=0A=
=0A=
Various discussions of this issue exist:=0A=
=0A=
- https://forum.manjaro.org/t/usb-ethernet-adapter-hangs-system-reliably/44=
755/14=0A=
- https://bugzilla.opensuse.org/show_bug.cgi?id=3D1083866=0A=
- https://bugzilla.kernel.org/show_bug.cgi?id=3D198931 (r8152)=0A=
- https://bugzilla.kernel.org/show_bug.cgi?id=3D200977 (r8153)=0A=
=0A=
The last one - Kernel bug 200977 - seems most relevant. It has been open si=
nce=0A=
2018 on 4.15.0-33-generic.=0A=
=0A=
lsusb snippet:=0A=
=0A=
idVendor           0x0bda Realtek Semiconductor Corp.=0A=
idProduct          0x8153 RTL8153 Gigabit Ethernet Adapter=0A=
bcdDevice           31.00=0A=
iManufacturer           1 Realtek=0A=
iProduct                2 USB 10/100/1000 LAN=0A=
iSerial                 6 001000001=0A=
=0A=
journalctl snippet:=0A=
=0A=
Jan 01 18:15:52 dm-labtop-mk4 kernel: INFO: task kworker/8:1:2634 blocked f=
or more than 122 seconds.=0A=
Jan 01 18:15:52 dm-labtop-mk4 kernel:       Tainted: G           OE     5.1=
0.2-2-MANJARO #1=0A=
Jan 01 18:15:52 dm-labtop-mk4 kernel: "echo 0 > /proc/sys/kernel/hung_task_=
timeout_secs" disables this message.=0A=
Jan 01 18:15:52 dm-labtop-mk4 kernel: task:kworker/8:1     state:D stack:  =
  0 pid: 2634 ppid:     2 flags:0x00004080=0A=
Jan 01 18:15:52 dm-labtop-mk4 kernel: Workqueue: events rtl_work_func_t [r8=
152]=0A=
Jan 01 18:15:52 dm-labtop-mk4 kernel: Call Trace:=0A=
Jan 01 18:15:52 dm-labtop-mk4 kernel:  __schedule+0x295/0x810=0A=
Jan 01 18:15:52 dm-labtop-mk4 kernel:  schedule+0x5b/0xc0=0A=
Jan 01 18:15:52 dm-labtop-mk4 kernel:  rpm_resume+0x18c/0x810=0A=
Jan 01 18:15:52 dm-labtop-mk4 kernel:  ? wait_woken+0x80/0x80=0A=
Jan 01 18:15:52 dm-labtop-mk4 kernel:  rpm_resume+0x308/0x810=0A=
Jan 01 18:15:52 dm-labtop-mk4 kernel:  __pm_runtime_resume+0x3b/0x60=0A=
Jan 01 18:15:52 dm-labtop-mk4 kernel:  usb_autopm_get_interface+0x18/0x50=
=0A=
Jan 01 18:15:52 dm-labtop-mk4 kernel:  rtl_work_func_t+0x69/0x2d0 [r8152]=
=0A=
Jan 01 18:15:52 dm-labtop-mk4 kernel:  process_one_work+0x1d6/0x3a0=0A=
Jan 01 18:15:52 dm-labtop-mk4 kernel:  worker_thread+0x4d/0x3d0=0A=
Jan 01 18:15:52 dm-labtop-mk4 kernel:  ? rescuer_thread+0x410/0x410=0A=
Jan 01 18:15:52 dm-labtop-mk4 kernel:  kthread+0x133/0x150=0A=
Jan 01 18:15:52 dm-labtop-mk4 kernel:  ? __kthread_bind_mask+0x60/0x60=0A=
Jan 01 18:15:52 dm-labtop-mk4 kernel:  ret_from_fork+0x1f/0x30=0A=
Jan 01 18:17:55 dm-labtop-mk4 kernel: INFO: task kworker/8:1:2634 blocked f=
or more than 245 seconds.=0A=
Jan 01 18:17:55 dm-labtop-mk4 kernel:       Tainted: G           OE     5.1=
0.2-2-MANJARO #1=0A=
Jan 01 18:17:55 dm-labtop-mk4 kernel: "echo 0 > /proc/sys/kernel/hung_task_=
timeout_secs" disables this message.=0A=
Jan 01 18:17:55 dm-labtop-mk4 kernel: task:kworker/8:1     state:D stack:  =
  0 pid: 2634 ppid:     2 flags:0x00004080=0A=
Jan 01 18:17:55 dm-labtop-mk4 kernel: Workqueue: events rtl_work_func_t [r8=
152]=0A=
=0A=
Full output:=0A=
=0A=
$ lsusb -v=0A=
=0A=
Bus 002 Device 005: ID 0bda:8153 Realtek Semiconductor Corp. RTL8153 Gigabi=
t Ethernet Adapter=0A=
Couldn't open device, some information will be missing=0A=
Device Descriptor:=0A=
  bLength                18=0A=
  bDescriptorType         1=0A=
  bcdUSB               3.00=0A=
  bDeviceClass            0=0A=
  bDeviceSubClass         0=0A=
  bDeviceProtocol         0=0A=
  bMaxPacketSize0         9=0A=
  idVendor           0x0bda Realtek Semiconductor Corp.=0A=
  idProduct          0x8153 RTL8153 Gigabit Ethernet Adapter=0A=
  bcdDevice           31.00=0A=
  iManufacturer           1 Realtek=0A=
  iProduct                2 USB 10/100/1000 LAN=0A=
  iSerial                 6 001000001=0A=
  bNumConfigurations      2=0A=
  Configuration Descriptor:=0A=
    bLength                 9=0A=
    bDescriptorType         2=0A=
    wTotalLength       0x0039=0A=
    bNumInterfaces          1=0A=
    bConfigurationValue     1=0A=
    iConfiguration          0=0A=
    bmAttributes         0xa0=0A=
      (Bus Powered)=0A=
      Remote Wakeup=0A=
    MaxPower              288mA=0A=
    Interface Descriptor:=0A=
      bLength                 9=0A=
      bDescriptorType         4=0A=
      bInterfaceNumber        0=0A=
      bAlternateSetting       0=0A=
      bNumEndpoints           3=0A=
      bInterfaceClass       255 Vendor Specific Class=0A=
      bInterfaceSubClass    255 Vendor Specific Subclass=0A=
      bInterfaceProtocol      0=0A=
      iInterface              0=0A=
      Endpoint Descriptor:=0A=
        bLength                 7=0A=
        bDescriptorType         5=0A=
        bEndpointAddress     0x81  EP 1 IN=0A=
        bmAttributes            2=0A=
          Transfer Type            Bulk=0A=
          Synch Type               None=0A=
          Usage Type               Data=0A=
        wMaxPacketSize     0x0400  1x 1024 bytes=0A=
        bInterval               0=0A=
        bMaxBurst               3=0A=
      Endpoint Descriptor:=0A=
        bLength                 7=0A=
        bDescriptorType         5=0A=
        bEndpointAddress     0x02  EP 2 OUT=0A=
        bmAttributes            2=0A=
          Transfer Type            Bulk=0A=
          Synch Type               None=0A=
          Usage Type               Data=0A=
        wMaxPacketSize     0x0400  1x 1024 bytes=0A=
        bInterval               0=0A=
        bMaxBurst               3=0A=
      Endpoint Descriptor:=0A=
        bLength                 7=0A=
        bDescriptorType         5=0A=
        bEndpointAddress     0x83  EP 3 IN=0A=
        bmAttributes            3=0A=
          Transfer Type            Interrupt=0A=
          Synch Type               None=0A=
          Usage Type               Data=0A=
        wMaxPacketSize     0x0002  1x 2 bytes=0A=
        bInterval               8=0A=
        bMaxBurst               0=0A=
  Configuration Descriptor:=0A=
    bLength                 9=0A=
    bDescriptorType         2=0A=
    wTotalLength       0x0062=0A=
    bNumInterfaces          2=0A=
    bConfigurationValue     2=0A=
    iConfiguration          0=0A=
    bmAttributes         0xa0=0A=
      (Bus Powered)=0A=
      Remote Wakeup=0A=
    MaxPower              288mA=0A=
    Interface Descriptor:=0A=
      bLength                 9=0A=
      bDescriptorType         4=0A=
      bInterfaceNumber        0=0A=
      bAlternateSetting       0=0A=
      bNumEndpoints           1=0A=
      bInterfaceClass         2 Communications=0A=
      bInterfaceSubClass      6 Ethernet Networking=0A=
      bInterfaceProtocol      0=0A=
      iInterface              5=0A=
      CDC Header:=0A=
        bcdCDC               1.10=0A=
      CDC Union:=0A=
        bMasterInterface        0=0A=
        bSlaveInterface         1=0A=
      CDC Ethernet:=0A=
        iMacAddress                      3 (??)=0A=
        bmEthernetStatistics    0x00000000=0A=
        wMaxSegmentSize               1514=0A=
        wNumberMCFilters            0x0000=0A=
        bNumberPowerFilters              0=0A=
      Endpoint Descriptor:=0A=
        bLength                 7=0A=
        bDescriptorType         5=0A=
        bEndpointAddress     0x83  EP 3 IN=0A=
        bmAttributes            3=0A=
          Transfer Type            Interrupt=0A=
          Synch Type               None=0A=
          Usage Type               Data=0A=
        wMaxPacketSize     0x0010  1x 16 bytes=0A=
        bInterval               8=0A=
        bMaxBurst               0=0A=
    Interface Descriptor:=0A=
      bLength                 9=0A=
      bDescriptorType         4=0A=
      bInterfaceNumber        1=0A=
      bAlternateSetting       0=0A=
      bNumEndpoints           0=0A=
      bInterfaceClass        10 CDC Data=0A=
      bInterfaceSubClass      0=0A=
      bInterfaceProtocol      0=0A=
      iInterface              0=0A=
    Interface Descriptor:=0A=
      bLength                 9=0A=
      bDescriptorType         4=0A=
      bInterfaceNumber        1=0A=
      bAlternateSetting       1=0A=
      bNumEndpoints           2=0A=
      bInterfaceClass        10 CDC Data=0A=
      bInterfaceSubClass      0=0A=
      bInterfaceProtocol      0=0A=
      iInterface              4=0A=
      Endpoint Descriptor:=0A=
        bLength                 7=0A=
        bDescriptorType         5=0A=
        bEndpointAddress     0x81  EP 1 IN=0A=
        bmAttributes            2=0A=
          Transfer Type            Bulk=0A=
          Synch Type               None=0A=
          Usage Type               Data=0A=
        wMaxPacketSize     0x0400  1x 1024 bytes=0A=
        bInterval               0=0A=
        bMaxBurst               3=0A=
      Endpoint Descriptor:=0A=
        bLength                 7=0A=
        bDescriptorType         5=0A=
        bEndpointAddress     0x02  EP 2 OUT=0A=
        bmAttributes            2=0A=
          Transfer Type            Bulk=0A=
          Synch Type               None=0A=
          Usage Type               Data=0A=
        wMaxPacketSize     0x0400  1x 1024 bytes=0A=
        bInterval               0=0A=
        bMaxBurst               3=0A=
=0A=
Jan 01 18:15:52 dm-labtop-mk4 kernel: INFO: task kworker/8:1:2634 blocked f=
or more than 122 seconds.=0A=
Jan 01 18:15:52 dm-labtop-mk4 kernel:       Tainted: G           OE     5.1=
0.2-2-MANJARO #1=0A=
Jan 01 18:15:52 dm-labtop-mk4 kernel: "echo 0 > /proc/sys/kernel/hung_task_=
timeout_secs" disables this message.=0A=
Jan 01 18:15:52 dm-labtop-mk4 kernel: task:kworker/8:1     state:D stack:  =
  0 pid: 2634 ppid:     2 flags:0x00004080=0A=
Jan 01 18:15:52 dm-labtop-mk4 kernel: Workqueue: events rtl_work_func_t [r8=
152]=0A=
Jan 01 18:15:52 dm-labtop-mk4 kernel: Call Trace:=0A=
Jan 01 18:15:52 dm-labtop-mk4 kernel:  __schedule+0x295/0x810=0A=
Jan 01 18:15:52 dm-labtop-mk4 kernel:  schedule+0x5b/0xc0=0A=
Jan 01 18:15:52 dm-labtop-mk4 kernel:  rpm_resume+0x18c/0x810=0A=
Jan 01 18:15:52 dm-labtop-mk4 kernel:  ? wait_woken+0x80/0x80=0A=
Jan 01 18:15:52 dm-labtop-mk4 kernel:  rpm_resume+0x308/0x810=0A=
Jan 01 18:15:52 dm-labtop-mk4 kernel:  __pm_runtime_resume+0x3b/0x60=0A=
Jan 01 18:15:52 dm-labtop-mk4 kernel:  usb_autopm_get_interface+0x18/0x50=
=0A=
Jan 01 18:15:52 dm-labtop-mk4 kernel:  rtl_work_func_t+0x69/0x2d0 [r8152]=
=0A=
Jan 01 18:15:52 dm-labtop-mk4 kernel:  process_one_work+0x1d6/0x3a0=0A=
Jan 01 18:15:52 dm-labtop-mk4 kernel:  worker_thread+0x4d/0x3d0=0A=
Jan 01 18:15:52 dm-labtop-mk4 kernel:  ? rescuer_thread+0x410/0x410=0A=
Jan 01 18:15:52 dm-labtop-mk4 kernel:  kthread+0x133/0x150=0A=
Jan 01 18:15:52 dm-labtop-mk4 kernel:  ? __kthread_bind_mask+0x60/0x60=0A=
Jan 01 18:15:52 dm-labtop-mk4 kernel:  ret_from_fork+0x1f/0x30=0A=
Jan 01 18:17:55 dm-labtop-mk4 kernel: INFO: task kworker/8:1:2634 blocked f=
or more than 245 seconds.=0A=
Jan 01 18:17:55 dm-labtop-mk4 kernel:       Tainted: G           OE     5.1=
0.2-2-MANJARO #1=0A=
Jan 01 18:17:55 dm-labtop-mk4 kernel: "echo 0 > /proc/sys/kernel/hung_task_=
timeout_secs" disables this message.=0A=
Jan 01 18:17:55 dm-labtop-mk4 kernel: task:kworker/8:1     state:D stack:  =
  0 pid: 2634 ppid:     2 flags:0x00004080=0A=
Jan 01 18:17:55 dm-labtop-mk4 kernel: Workqueue: events rtl_work_func_t [r8=
152]=0A=
Jan 01 18:17:55 dm-labtop-mk4 kernel: Call Trace:=0A=
Jan 01 18:17:55 dm-labtop-mk4 kernel:  __schedule+0x295/0x810=0A=
Jan 01 18:17:55 dm-labtop-mk4 kernel:  schedule+0x5b/0xc0=0A=
Jan 01 18:17:55 dm-labtop-mk4 kernel:  rpm_resume+0x18c/0x810=0A=
Jan 01 18:17:55 dm-labtop-mk4 kernel:  ? wait_woken+0x80/0x80=0A=
Jan 01 18:17:55 dm-labtop-mk4 kernel:  rpm_resume+0x308/0x810=0A=
Jan 01 18:17:55 dm-labtop-mk4 kernel:  __pm_runtime_resume+0x3b/0x60=0A=
Jan 01 18:17:55 dm-labtop-mk4 kernel:  usb_autopm_get_interface+0x18/0x50=
=0A=
Jan 01 18:17:55 dm-labtop-mk4 kernel:  rtl_work_func_t+0x69/0x2d0 [r8152]=
=0A=
Jan 01 18:17:55 dm-labtop-mk4 kernel:  process_one_work+0x1d6/0x3a0=0A=
Jan 01 18:17:55 dm-labtop-mk4 kernel:  worker_thread+0x4d/0x3d0=0A=
Jan 01 18:17:55 dm-labtop-mk4 kernel:  ? rescuer_thread+0x410/0x410=0A=
Jan 01 18:17:55 dm-labtop-mk4 kernel:  kthread+0x133/0x150=0A=
Jan 01 18:17:55 dm-labtop-mk4 kernel:  ? __kthread_bind_mask+0x60/0x60=0A=
Jan 01 18:17:55 dm-labtop-mk4 kernel:  ret_from_fork+0x1f/0x30=0A=
Jan 01 18:19:58 dm-labtop-mk4 kernel: INFO: task kworker/8:1:2634 blocked f=
or more than 368 seconds.=0A=
Jan 01 18:19:58 dm-labtop-mk4 kernel:       Tainted: G           OE     5.1=
0.2-2-MANJARO #1=0A=
Jan 01 18:19:58 dm-labtop-mk4 kernel: "echo 0 > /proc/sys/kernel/hung_task_=
timeout_secs" disables this message.=0A=
Jan 01 18:19:58 dm-labtop-mk4 kernel: task:kworker/8:1     state:D stack:  =
  0 pid: 2634 ppid:     2 flags:0x00004080=0A=
Jan 01 18:19:58 dm-labtop-mk4 kernel: Workqueue: events rtl_work_func_t [r8=
152]=0A=
Jan 01 18:19:58 dm-labtop-mk4 kernel: Call Trace:=0A=
Jan 01 18:19:58 dm-labtop-mk4 kernel:  __schedule+0x295/0x810=0A=
Jan 01 18:19:58 dm-labtop-mk4 kernel:  schedule+0x5b/0xc0=0A=
Jan 01 18:19:58 dm-labtop-mk4 kernel:  rpm_resume+0x18c/0x810=0A=
Jan 01 18:19:58 dm-labtop-mk4 kernel:  ? wait_woken+0x80/0x80=0A=
Jan 01 18:19:58 dm-labtop-mk4 kernel:  rpm_resume+0x308/0x810=0A=
Jan 01 18:19:58 dm-labtop-mk4 kernel:  __pm_runtime_resume+0x3b/0x60=0A=
Jan 01 18:19:58 dm-labtop-mk4 kernel:  usb_autopm_get_interface+0x18/0x50=
=0A=
Jan 01 18:19:58 dm-labtop-mk4 kernel:  rtl_work_func_t+0x69/0x2d0 [r8152]=
=0A=
Jan 01 18:19:58 dm-labtop-mk4 kernel:  process_one_work+0x1d6/0x3a0=0A=
Jan 01 18:19:58 dm-labtop-mk4 kernel:  worker_thread+0x4d/0x3d0=0A=
Jan 01 18:19:58 dm-labtop-mk4 kernel:  ? rescuer_thread+0x410/0x410=0A=
Jan 01 18:19:58 dm-labtop-mk4 kernel:  kthread+0x133/0x150=0A=
Jan 01 18:19:58 dm-labtop-mk4 kernel:  ? __kthread_bind_mask+0x60/0x60=0A=
Jan 01 18:19:58 dm-labtop-mk4 kernel:  ret_from_fork+0x1f/0x30=0A=
Jan 01 18:22:00 dm-labtop-mk4 kernel: INFO: task kworker/8:1:2634 blocked f=
or more than 491 seconds.=0A=
Jan 01 18:22:01 dm-labtop-mk4 kernel:       Tainted: G           OE     5.1=
0.2-2-MANJARO #1=0A=
Jan 01 18:22:01 dm-labtop-mk4 kernel: "echo 0 > /proc/sys/kernel/hung_task_=
timeout_secs" disables this message.=0A=
Jan 01 18:22:01 dm-labtop-mk4 kernel: task:kworker/8:1     state:D stack:  =
  0 pid: 2634 ppid:     2 flags:0x00004080=0A=
Jan 01 18:22:01 dm-labtop-mk4 kernel: Workqueue: events rtl_work_func_t [r8=
152]=0A=
Jan 01 18:22:01 dm-labtop-mk4 kernel: Call Trace:=0A=
Jan 01 18:22:01 dm-labtop-mk4 kernel:  __schedule+0x295/0x810=0A=
Jan 01 18:22:01 dm-labtop-mk4 kernel:  schedule+0x5b/0xc0=0A=
Jan 01 18:22:01 dm-labtop-mk4 kernel:  rpm_resume+0x18c/0x810=0A=
Jan 01 18:22:01 dm-labtop-mk4 kernel:  ? wait_woken+0x80/0x80=0A=
Jan 01 18:22:01 dm-labtop-mk4 kernel:  rpm_resume+0x308/0x810=0A=
Jan 01 18:22:01 dm-labtop-mk4 kernel:  __pm_runtime_resume+0x3b/0x60=0A=
Jan 01 18:22:01 dm-labtop-mk4 kernel:  usb_autopm_get_interface+0x18/0x50=
=0A=
Jan 01 18:22:01 dm-labtop-mk4 kernel:  rtl_work_func_t+0x69/0x2d0 [r8152]=
=0A=
Jan 01 18:22:01 dm-labtop-mk4 kernel:  process_one_work+0x1d6/0x3a0=0A=
Jan 01 18:22:01 dm-labtop-mk4 kernel:  worker_thread+0x4d/0x3d0=0A=
Jan 01 18:22:01 dm-labtop-mk4 kernel:  ? rescuer_thread+0x410/0x410=0A=
Jan 01 18:22:01 dm-labtop-mk4 kernel:  kthread+0x133/0x150=0A=
Jan 01 18:22:01 dm-labtop-mk4 kernel:  ? __kthread_bind_mask+0x60/0x60=0A=
Jan 01 18:22:01 dm-labtop-mk4 kernel:  ret_from_fork+0x1f/0x30=0A=
Jan 01 18:24:03 dm-labtop-mk4 kernel: INFO: task kworker/8:1:2634 blocked f=
or more than 614 seconds.=0A=
Jan 01 18:24:03 dm-labtop-mk4 kernel:       Tainted: G           OE     5.1=
0.2-2-MANJARO #1=0A=
Jan 01 18:24:03 dm-labtop-mk4 kernel: "echo 0 > /proc/sys/kernel/hung_task_=
timeout_secs" disables this message.=0A=
Jan 01 18:24:03 dm-labtop-mk4 kernel: task:kworker/8:1     state:D stack:  =
  0 pid: 2634 ppid:     2 flags:0x00004080=0A=
Jan 01 18:24:03 dm-labtop-mk4 kernel: Workqueue: events rtl_work_func_t [r8=
152]=0A=
Jan 01 18:24:03 dm-labtop-mk4 kernel: Call Trace:=0A=
Jan 01 18:24:03 dm-labtop-mk4 kernel:  __schedule+0x295/0x810=0A=
Jan 01 18:24:03 dm-labtop-mk4 kernel:  schedule+0x5b/0xc0=0A=
Jan 01 18:24:03 dm-labtop-mk4 kernel:  rpm_resume+0x18c/0x810=0A=
Jan 01 18:24:03 dm-labtop-mk4 kernel:  ? wait_woken+0x80/0x80=0A=
Jan 01 18:24:03 dm-labtop-mk4 kernel:  rpm_resume+0x308/0x810=0A=
Jan 01 18:24:03 dm-labtop-mk4 kernel:  __pm_runtime_resume+0x3b/0x60=0A=
Jan 01 18:24:03 dm-labtop-mk4 kernel:  usb_autopm_get_interface+0x18/0x50=
=0A=
Jan 01 18:24:03 dm-labtop-mk4 kernel:  rtl_work_func_t+0x69/0x2d0 [r8152]=
=0A=
Jan 01 18:24:03 dm-labtop-mk4 kernel:  process_one_work+0x1d6/0x3a0=0A=
Jan 01 18:24:03 dm-labtop-mk4 kernel:  worker_thread+0x4d/0x3d0=0A=
Jan 01 18:24:03 dm-labtop-mk4 kernel:  ? rescuer_thread+0x410/0x410=0A=
Jan 01 18:24:03 dm-labtop-mk4 kernel:  kthread+0x133/0x150=0A=
Jan 01 18:24:03 dm-labtop-mk4 kernel:  ? __kthread_bind_mask+0x60/0x60=0A=
Jan 01 18:24:03 dm-labtop-mk4 kernel:  ret_from_fork+0x1f/0x30=0A=
Jan 01 18:26:06 dm-labtop-mk4 kernel: INFO: task kworker/8:1:2634 blocked f=
or more than 737 seconds.=0A=
Jan 01 18:26:06 dm-labtop-mk4 kernel:       Tainted: G           OE     5.1=
0.2-2-MANJARO #1=0A=
Jan 01 18:26:06 dm-labtop-mk4 kernel: "echo 0 > /proc/sys/kernel/hung_task_=
timeout_secs" disables this message.=0A=
Jan 01 18:26:06 dm-labtop-mk4 kernel: task:kworker/8:1     state:D stack:  =
  0 pid: 2634 ppid:     2 flags:0x00004080=0A=
Jan 01 18:26:06 dm-labtop-mk4 kernel: Workqueue: events rtl_work_func_t [r8=
152]=0A=
Jan 01 18:26:06 dm-labtop-mk4 kernel: Call Trace:=0A=
Jan 01 18:26:06 dm-labtop-mk4 kernel:  __schedule+0x295/0x810=0A=
Jan 01 18:26:06 dm-labtop-mk4 kernel:  schedule+0x5b/0xc0=0A=
Jan 01 18:26:06 dm-labtop-mk4 kernel:  rpm_resume+0x18c/0x810=0A=
Jan 01 18:26:06 dm-labtop-mk4 kernel:  ? wait_woken+0x80/0x80=0A=
Jan 01 18:26:06 dm-labtop-mk4 kernel:  rpm_resume+0x308/0x810=0A=
Jan 01 18:26:06 dm-labtop-mk4 kernel:  __pm_runtime_resume+0x3b/0x60=0A=
Jan 01 18:26:06 dm-labtop-mk4 kernel:  usb_autopm_get_interface+0x18/0x50=
=0A=
Jan 01 18:26:06 dm-labtop-mk4 kernel:  rtl_work_func_t+0x69/0x2d0 [r8152]=
=0A=
Jan 01 18:26:06 dm-labtop-mk4 kernel:  process_one_work+0x1d6/0x3a0=0A=
Jan 01 18:26:06 dm-labtop-mk4 kernel:  worker_thread+0x4d/0x3d0=0A=
Jan 01 18:26:06 dm-labtop-mk4 kernel:  ? rescuer_thread+0x410/0x410=0A=
Jan 01 18:26:06 dm-labtop-mk4 kernel:  kthread+0x133/0x150=0A=
Jan 01 18:26:06 dm-labtop-mk4 kernel:  ? __kthread_bind_mask+0x60/0x60=0A=
Jan 01 18:26:06 dm-labtop-mk4 kernel:  ret_from_fork+0x1f/0x30=0A=
Jan 01 18:28:09 dm-labtop-mk4 kernel: INFO: task kworker/8:1:2634 blocked f=
or more than 860 seconds.=0A=
Jan 01 18:28:09 dm-labtop-mk4 kernel:       Tainted: G           OE     5.1=
0.2-2-MANJARO #1=0A=
Jan 01 18:28:09 dm-labtop-mk4 kernel: "echo 0 > /proc/sys/kernel/hung_task_=
timeout_secs" disables this message.=0A=
Jan 01 18:28:09 dm-labtop-mk4 kernel: task:kworker/8:1     state:D stack:  =
  0 pid: 2634 ppid:     2 flags:0x00004080=0A=
Jan 01 18:28:09 dm-labtop-mk4 kernel: Workqueue: events rtl_work_func_t [r8=
152]=0A=
Jan 01 18:28:09 dm-labtop-mk4 kernel: Call Trace:=0A=
Jan 01 18:28:09 dm-labtop-mk4 kernel:  __schedule+0x295/0x810=0A=
Jan 01 18:28:09 dm-labtop-mk4 kernel:  schedule+0x5b/0xc0=0A=
Jan 01 18:28:09 dm-labtop-mk4 kernel:  rpm_resume+0x18c/0x810=0A=
Jan 01 18:28:09 dm-labtop-mk4 kernel:  ? wait_woken+0x80/0x80=0A=
Jan 01 18:28:09 dm-labtop-mk4 kernel:  rpm_resume+0x308/0x810=0A=
Jan 01 18:28:09 dm-labtop-mk4 kernel:  __pm_runtime_resume+0x3b/0x60=0A=
Jan 01 18:28:09 dm-labtop-mk4 kernel:  usb_autopm_get_interface+0x18/0x50=
=0A=
Jan 01 18:28:09 dm-labtop-mk4 kernel:  rtl_work_func_t+0x69/0x2d0 [r8152]=
=0A=
Jan 01 18:28:09 dm-labtop-mk4 kernel:  process_one_work+0x1d6/0x3a0=0A=
Jan 01 18:28:09 dm-labtop-mk4 kernel:  worker_thread+0x4d/0x3d0=0A=
Jan 01 18:28:09 dm-labtop-mk4 kernel:  ? rescuer_thread+0x410/0x410=0A=
Jan 01 18:28:09 dm-labtop-mk4 kernel:  kthread+0x133/0x150=0A=
Jan 01 18:28:09 dm-labtop-mk4 kernel:  ? __kthread_bind_mask+0x60/0x60=0A=
Jan 01 18:28:09 dm-labtop-mk4 kernel:  ret_from_fork+0x1f/0x30=0A=
Jan 01 18:30:12 dm-labtop-mk4 kernel: INFO: task kworker/8:1:2634 blocked f=
or more than 983 seconds.=0A=
Jan 01 18:30:12 dm-labtop-mk4 kernel:       Tainted: G           OE     5.1=
0.2-2-MANJARO #1=0A=
Jan 01 18:30:12 dm-labtop-mk4 kernel: "echo 0 > /proc/sys/kernel/hung_task_=
timeout_secs" disables this message.=0A=
Jan 01 18:30:12 dm-labtop-mk4 kernel: task:kworker/8:1     state:D stack:  =
  0 pid: 2634 ppid:     2 flags:0x00004080=0A=
Jan 01 18:30:12 dm-labtop-mk4 kernel: Workqueue: events rtl_work_func_t [r8=
152]=0A=
Jan 01 18:30:12 dm-labtop-mk4 kernel: Call Trace:=0A=
Jan 01 18:30:12 dm-labtop-mk4 kernel:  __schedule+0x295/0x810=0A=
Jan 01 18:30:12 dm-labtop-mk4 kernel:  schedule+0x5b/0xc0=0A=
Jan 01 18:30:12 dm-labtop-mk4 kernel:  rpm_resume+0x18c/0x810=0A=
Jan 01 18:30:12 dm-labtop-mk4 kernel:  ? wait_woken+0x80/0x80=0A=
Jan 01 18:30:12 dm-labtop-mk4 kernel:  rpm_resume+0x308/0x810=0A=
Jan 01 18:30:12 dm-labtop-mk4 kernel:  __pm_runtime_resume+0x3b/0x60=0A=
Jan 01 18:30:12 dm-labtop-mk4 kernel:  usb_autopm_get_interface+0x18/0x50=
=0A=
Jan 01 18:30:12 dm-labtop-mk4 kernel:  rtl_work_func_t+0x69/0x2d0 [r8152]=
=0A=
Jan 01 18:30:12 dm-labtop-mk4 kernel:  process_one_work+0x1d6/0x3a0=0A=
Jan 01 18:30:12 dm-labtop-mk4 kernel:  worker_thread+0x4d/0x3d0=0A=
Jan 01 18:30:12 dm-labtop-mk4 kernel:  ? rescuer_thread+0x410/0x410=0A=
Jan 01 18:30:12 dm-labtop-mk4 kernel:  kthread+0x133/0x150=0A=
Jan 01 18:30:12 dm-labtop-mk4 kernel:  ? __kthread_bind_mask+0x60/0x60=0A=
Jan 01 18:30:12 dm-labtop-mk4 kernel:  ret_from_fork+0x1f/0x30=0A=
Jan 01 18:32:15 dm-labtop-mk4 kernel: INFO: task kworker/8:1:2634 blocked f=
or more than 1105 seconds.=0A=
Jan 01 18:32:15 dm-labtop-mk4 kernel:       Tainted: G           OE     5.1=
0.2-2-MANJARO #1=0A=
Jan 01 18:32:15 dm-labtop-mk4 kernel: "echo 0 > /proc/sys/kernel/hung_task_=
timeout_secs" disables this message.=0A=
Jan 01 18:32:15 dm-labtop-mk4 kernel: task:kworker/8:1     state:D stack:  =
  0 pid: 2634 ppid:     2 flags:0x00004080=0A=
Jan 01 18:32:15 dm-labtop-mk4 kernel: Workqueue: events rtl_work_func_t [r8=
152]=0A=
Jan 01 18:32:15 dm-labtop-mk4 kernel: Call Trace:=0A=
Jan 01 18:32:15 dm-labtop-mk4 kernel:  __schedule+0x295/0x810=0A=
Jan 01 18:32:15 dm-labtop-mk4 kernel:  schedule+0x5b/0xc0=0A=
Jan 01 18:32:15 dm-labtop-mk4 kernel:  rpm_resume+0x18c/0x810=0A=
Jan 01 18:32:15 dm-labtop-mk4 kernel:  ? wait_woken+0x80/0x80=0A=
Jan 01 18:32:15 dm-labtop-mk4 kernel:  rpm_resume+0x308/0x810=0A=
Jan 01 18:32:15 dm-labtop-mk4 kernel:  __pm_runtime_resume+0x3b/0x60=0A=
Jan 01 18:32:15 dm-labtop-mk4 kernel:  usb_autopm_get_interface+0x18/0x50=
=0A=
Jan 01 18:32:15 dm-labtop-mk4 kernel:  rtl_work_func_t+0x69/0x2d0 [r8152]=
=0A=
Jan 01 18:32:15 dm-labtop-mk4 kernel:  process_one_work+0x1d6/0x3a0=0A=
Jan 01 18:32:15 dm-labtop-mk4 kernel:  worker_thread+0x4d/0x3d0=0A=
Jan 01 18:32:15 dm-labtop-mk4 kernel:  ? rescuer_thread+0x410/0x410=0A=
Jan 01 18:32:15 dm-labtop-mk4 kernel:  kthread+0x133/0x150=0A=
Jan 01 18:32:15 dm-labtop-mk4 kernel:  ? __kthread_bind_mask+0x60/0x60=0A=
Jan 01 18:32:15 dm-labtop-mk4 kernel:  ret_from_fork+0x1f/0x30=0A=
Jan 01 18:32:44 dm-labtop-mk4 wpa_supplicant[625]: wlo1: CTRL-EVENT-BEACON-=
LOSS=0A=
Jan 01 18:32:44 dm-labtop-mk4 wpa_supplicant[625]: wlo1: CTRL-EVENT-BEACON-=
LOSS=0A=
Jan 01 18:32:44 dm-labtop-mk4 wpa_supplicant[625]: wlo1: CTRL-EVENT-BEACON-=
LOSS=0A=
Jan 01 18:32:44 dm-labtop-mk4 wpa_supplicant[625]: wlo1: CTRL-EVENT-BEACON-=
LOSS=0A=
Jan 01 18:34:18 dm-labtop-mk4 kernel: INFO: task kworker/8:1:2634 blocked f=
or more than 1228 seconds.=0A=
Jan 01 18:34:18 dm-labtop-mk4 kernel:       Tainted: G           OE     5.1=
0.2-2-MANJARO #1=0A=
Jan 01 18:34:18 dm-labtop-mk4 kernel: "echo 0 > /proc/sys/kernel/hung_task_=
timeout_secs" disables this message.=0A=
Jan 01 18:34:18 dm-labtop-mk4 kernel: task:kworker/8:1     state:D stack:  =
  0 pid: 2634 ppid:     2 flags:0x00004080=0A=
Jan 01 18:34:18 dm-labtop-mk4 kernel: Workqueue: events rtl_work_func_t [r8=
152]=0A=
Jan 01 18:34:18 dm-labtop-mk4 kernel: Call Trace:=0A=
Jan 01 18:34:18 dm-labtop-mk4 kernel:  __schedule+0x295/0x810=0A=
Jan 01 18:34:18 dm-labtop-mk4 kernel:  schedule+0x5b/0xc0=0A=
Jan 01 18:34:18 dm-labtop-mk4 kernel:  rpm_resume+0x18c/0x810=0A=
Jan 01 18:34:18 dm-labtop-mk4 kernel:  ? wait_woken+0x80/0x80=0A=
Jan 01 18:34:18 dm-labtop-mk4 kernel:  rpm_resume+0x308/0x810=0A=
Jan 01 18:34:18 dm-labtop-mk4 kernel:  __pm_runtime_resume+0x3b/0x60=0A=
Jan 01 18:34:18 dm-labtop-mk4 kernel:  usb_autopm_get_interface+0x18/0x50=
=0A=
Jan 01 18:34:18 dm-labtop-mk4 kernel:  rtl_work_func_t+0x69/0x2d0 [r8152]=
=0A=
Jan 01 18:34:18 dm-labtop-mk4 kernel:  process_one_work+0x1d6/0x3a0=0A=
Jan 01 18:34:18 dm-labtop-mk4 kernel:  worker_thread+0x4d/0x3d0=0A=
Jan 01 18:34:18 dm-labtop-mk4 kernel:  ? rescuer_thread+0x410/0x410=0A=
Jan 01 18:34:18 dm-labtop-mk4 kernel:  kthread+0x133/0x150=0A=
Jan 01 18:34:18 dm-labtop-mk4 kernel:  ? __kthread_bind_mask+0x60/0x60=0A=
Jan 01 18:34:18 dm-labtop-mk4 kernel:  ret_from_fork+0x1f/0x30=
