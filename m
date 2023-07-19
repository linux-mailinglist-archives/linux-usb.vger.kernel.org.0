Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B38B6758AD8
	for <lists+linux-usb@lfdr.de>; Wed, 19 Jul 2023 03:26:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229766AbjGSB0z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Jul 2023 21:26:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbjGSB0y (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Jul 2023 21:26:54 -0400
Received: from mail.synergyst.club (mail.synergyst.club [45.56.67.118])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F03212F
        for <linux-usb@vger.kernel.org>; Tue, 18 Jul 2023 18:26:53 -0700 (PDT)
Received: from box.synergyst.club (localhost [127.0.0.1])
        by mail.synergyst.club (Postfix) with ESMTPS id 191CD100BA1
        for <linux-usb@vger.kernel.org>; Tue, 18 Jul 2023 20:26:53 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.synergyst.club 191CD100BA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mail.synergyst.club;
        s=mail; t=1689730013;
        bh=YsrNEELwlkcpwsEmvXuwjfehl3v7rhNOfmAE+vofHp8=;
        h=Date:From:Subject:To:From;
        b=Dw7o6qirS21E9uul+Q85l3O5t6UnenXIBzhHsxmQBxNGdmJ6oWLom4Qy7o7KVl1FH
         sd0kCTaK8zehLgINV+MKBp38pef2ticc5ltJ8J/u2wP9gMiVUN7WRT248D954JSPYs
         MTzESkkarYrSmk+FRG/UNQZ9f3na31xV8aO7EZS+DQNiKSLi0GGNz3nJ08mITQOQj+
         CLbhftq21Cyn70AdyC0IAykYGEVT/6W8SX9Tv5EjV03xrHcDR7E2VoeJKFUsrJdbWb
         SnagqdZWtm9g1W7N+cu0/4SOV/lk0eVKKax2i0MVoXLmvI3y2VmcKNjHooM+xNGvY/
         PAL6AmuSWw4YA==
MIME-Version: 1.0
Date:   Wed, 19 Jul 2023 01:26:53 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: RainLoop/1.14.0
From:   administrator@mail.synergyst.club
Message-ID: <7af62c3c59a3239d2f64615b99049a5e@mail.synergyst.club>
Subject: Tell linux-usb@vger.kernel.org to add your device to a proper 
 driver.
To:     linux-usb@vger.kernel.org
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,=0A=0AI have an Infiray Micro III Lite that seems to need adding to=
 some driver.=0A=0AHere's a snippet of my lsusb --verbose command:=0A=0AB=
us 001 Device 003: ID 3474:750e=0ADevice Descriptor:=0AbLength 18=0AbDesc=
riptorType 1=0AbcdUSB 2.00=0AbDeviceClass 239 Miscellaneous Device=0AbDev=
iceSubClass 2 ?=0AbDeviceProtocol 1 Interface Association=0AbMaxPacketSiz=
e0 64=0AidVendor 0x3474=0AidProduct 0x750e=0AbcdDevice 0.00=0AiManufactur=
er 1 IRay=0AiProduct 2 M3Lite=0AiSerial 0=0AbNumConfigurations 1=0AConfig=
uration Descriptor:=0AbLength 9=0AbDescriptorType 2=0AwTotalLength 272=0A=
bNumInterfaces 4=0AbConfigurationValue 1=0AiConfiguration 0=0AbmAttribute=
s 0x80=0A(Bus Powered)=0AMaxPower 500mA=0AInterface Association:=0AbLengt=
h 8=0AbDescriptorType 11=0AbFirstInterface 0=0AbInterfaceCount 2=0AbFunct=
ionClass 14 Video=0AbFunctionSubClass 3 Video Interface Collection=0AbFun=
ctionProtocol 0=0AiFunction 2 M3Lite=0AInterface Descriptor:=0AbLength 9=
=0AbDescriptorType 4=0AbInterfaceNumber 0=0AbAlternateSetting 0=0AbNumEnd=
points 1=0AbInterfaceClass 14 Video=0AbInterfaceSubClass 1 Video Control=
=0AbInterfaceProtocol 0=0AiInterface 2 M3Lite=0AVideoControl Interface De=
scriptor:=0AbLength 13=0AbDescriptorType 36=0AbDescriptorSubtype 1 (HEADE=
R)=0AbcdUVC 1.10=0AwTotalLength 81=0AdwClockFrequency 48.000000MHz=0AbInC=
ollection 1=0AbaInterfaceNr( 0) 1=0AVideoControl Interface Descriptor:=0A=
bLength 18=0AbDescriptorType 36=0AbDescriptorSubtype 2 (INPUT_TERMINAL)=
=0AbTerminalID 1=0AwTerminalType 0x0201 Camera Sensor=0AbAssocTerminal 0=
=0AiTerminal 0=0AwObjectiveFocalLengthMin 1=0AwObjectiveFocalLengthMax 10=
=0AwOcularFocalLength 1=0AbControlSize 3=0AbmControls 0x00000200=0AZoom (=
Absolute)=0AVideoControl Interface Descriptor:=0AbLength 13=0AbDescriptor=
Type 36=0AbDescriptorSubtype 5 (PROCESSING_UNIT)=0AbUnitID 2=0AbSourceID =
1=0AwMaxMultiplier 16384=0AbControlSize 3=0AbmControls 0x00000000=0AiProc=
essing 0=0AbmVideoStandards 0x 0=0AVideoControl Interface Descriptor:=0Ab=
Length 28=0AbDescriptorType 36=0AbDescriptorSubtype 6 (EXTENSION_UNIT)=0A=
bUnitID 3=0AguidExtensionCode {ffffffff-ffff-ffff-ffff-ffffffffffff}=0AbN=
umControl 0=0AbNrPins 1=0AbaSourceID( 0) 2=0AbControlSize 3=0AbmControls(=
 0) 0x00=0AbmControls( 1) 0x00=0AbmControls( 2) 0x00=0AiExtension 0=0AVid=
eoControl Interface Descriptor:=0AbLength 9=0AbDescriptorType 36=0AbDescr=
iptorSubtype 3 (OUTPUT_TERMINAL)=0AbTerminalID 4=0AwTerminalType 0x0101 U=
SB Streaming=0AbAssocTerminal 0=0AbSourceID 3=0AiTerminal 0=0AEndpoint De=
scriptor:=0AbLength 7=0AbDescriptorType 5=0AbEndpointAddress 0x82 EP 2 IN=
=0AbmAttributes 3=0ATransfer Type Interrupt=0ASynch Type None=0AUsage Typ=
e Data=0AwMaxPacketSize 0x0040 1x 64 bytes=0AbInterval 8=0AInterface Desc=
riptor:=0AbLength 9=0AbDescriptorType 4=0AbInterfaceNumber 1=0AbAlternate=
Setting 0=0AbNumEndpoints 1=0AbInterfaceClass 14 Video=0AbInterfaceSubCla=
ss 2 Video Streaming=0AbInterfaceProtocol 0=0AiInterface 0=0AVideoStreami=
ng Interface Descriptor:=0AbLength 14=0AbDescriptorType 36=0AbDescriptorS=
ubtype 1 (INPUT_HEADER)=0AbNumFormats 1=0AwTotalLength 71=0AbEndPointAddr=
ess 131=0AbmInfo 0=0AbTerminalLink 4=0AbStillCaptureMethod 1=0AbTriggerSu=
pport 0=0AbTriggerUsage 0=0AbControlSize 1=0AbmaControls( 0) 27=0AVideoSt=
reaming Interface Descriptor:=0AbLength 27=0AbDescriptorType 36=0AbDescri=
ptorSubtype 4 (FORMAT_UNCOMPRESSED)=0AbFormatIndex 1=0AbNumFrameDescripto=
rs 1=0AguidFormat {59555932-0000-1000-8000-00aa00389b71}=0AbBitsPerPixel =
16=0AbDefaultFrameIndex 1=0AbAspectRatioX 8=0AbAspectRatioY 6=0AbmInterla=
ceFlags 0x00=0AInterlaced stream or variable: No=0AFields per frame: 2 fi=
elds=0AField 1 first: No=0AField pattern: Field 1 only=0AbCopyProtect 0=
=0AVideoStreaming Interface Descriptor:=0AbLength 30=0AbDescriptorType 36=
=0AbDescriptorSubtype 5 (FRAME_UNCOMPRESSED)=0AbFrameIndex 1=0AbmCapabili=
ties 0x01=0AStill image supported=0AwWidth 1280=0AwHeight 512=0AdwMinBitR=
ate 832000000=0AdwMaxBitRate 832000000=0AdwMaxVideoFrameBufferSize 131072=
0=0AdwDefaultFrameInterval 400000=0AbFrameIntervalType 1=0AdwFrameInterva=
l( 0) 400000=0AEndpoint Descriptor:=0AbLength 7=0AbDescriptorType 5=0AbEn=
dpointAddress 0x83 EP 3 IN=0AbmAttributes 2=0ATransfer Type Bulk=0ASynch =
Type None=0AUsage Type Data=0AwMaxPacketSize 0x0200 1x 512 bytes=0AbInter=
val 0=0AInterface Association:=0AbLength 8=0AbDescriptorType 11=0AbFirstI=
nterface 2=0AbInterfaceCount 2=0AbFunctionClass 2 Communications=0AbFunct=
ionSubClass 2 Abstract (modem)=0AbFunctionProtocol 1 AT-commands (v.25ter=
)=0AiFunction 0=0AInterface Descriptor:=0AbLength 9=0AbDescriptorType 4=
=0AbInterfaceNumber 2=0AbAlternateSetting 0=0AbNumEndpoints 1=0AbInterfac=
eClass 2 Communications=0AbInterfaceSubClass 2 Abstract (modem)=0AbInterf=
aceProtocol 1 AT-commands (v.25ter)=0AiInterface 0=0ACDC Header:=0AbcdCDC=
 1.10=0ACDC ACM:=0AbmCapabilities 0x02=0Aline coding and serial state=0AC=
DC Union:=0AbMasterInterface 2=0AbSlaveInterface 1=0ACDC Call Management:=
=0AbmCapabilities 0x00=0AbDataInterface 1=0AEndpoint Descriptor:=0AbLengt=
h 7=0AbDescriptorType 5=0AbEndpointAddress 0x81 EP 1 IN=0AbmAttributes 3=
=0ATransfer Type Interrupt=0ASynch Type None=0AUsage Type Data=0AwMaxPack=
etSize 0x0040 1x 64 bytes=0AbInterval 2=0AInterface Descriptor:=0AbLength=
 9=0AbDescriptorType 4=0AbInterfaceNumber 3=0AbAlternateSetting 0=0AbNumE=
ndpoints 2=0AbInterfaceClass 10 CDC Data=0AbInterfaceSubClass 0 Unused=0A=
bInterfaceProtocol 0=0AiInterface 0=0AEndpoint Descriptor:=0AbLength 7=0A=
bDescriptorType 5=0AbEndpointAddress 0x05 EP 5 OUT=0AbmAttributes 2=0ATra=
nsfer Type Bulk=0ASynch Type None=0AUsage Type Data=0AwMaxPacketSize 0x02=
00 1x 512 bytes=0AbInterval 0=0AEndpoint Descriptor:=0AbLength 7=0AbDescr=
iptorType 5=0AbEndpointAddress 0x85 EP 5 IN=0AbmAttributes 2=0ATransfer T=
ype Bulk=0ASynch Type None=0AUsage Type Data=0AwMaxPacketSize 0x0200 1x 5=
12 bytes=0AbInterval 0=0ADevice Status: 0x0000=0A(Bus Powered)=0A=0AHere'=
s an output from lsusb --tree --verbose:=0A=0A/: Bus 01.Port 1: Dev 1, Cl=
ass=3Droot_hub, Driver=3Dxhci-hcd/1p, 480M=0AID 1d6b:0002 Linux Foundatio=
n 2.0 root hub=0A|__ Port 1: Dev 2, If 0, Class=3DHub, Driver=3Dhub/4p, 4=
80M=0AID 1a40:0101 Terminus Technology Inc. Hub=0A|__ Port 1: Dev 4, If 0=
, Class=3DVendor Specific Class, Driver=3D, 480M=0AID 03e7:f63d Intel=0A|=
__ Port 1: Dev 4, If 1, Class=3DVideo, Driver=3Duvcvideo, 480M=0AID 03e7:=
f63d Intel=0A|__ Port 1: Dev 4, If 2, Class=3DVideo, Driver=3Duvcvideo, 4=
80M=0AID 03e7:f63d Intel=0A|__ Port 2: Dev 3, If 3, Class=3DCDC Data, Dri=
ver=3Dusbserial_generic, 480M=0AID 3474:750e=0A|__ Port 2: Dev 3, If 1, C=
lass=3DVideo, Driver=3Duvcvideo, 480M=0AID 3474:750e=0A|__ Port 2: Dev 3,=
 If 2, Class=3DCommunications, Driver=3D, 480M=0AID 3474:750e=0A|__ Port =
2: Dev 3, If 0, Class=3DVideo, Driver=3Duvcvideo, 480M=0AID 3474:750e
