Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93C856A3443
	for <lists+linux-usb@lfdr.de>; Sun, 26 Feb 2023 22:33:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229606AbjBZVdr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 26 Feb 2023 16:33:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229605AbjBZVdq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 26 Feb 2023 16:33:46 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AFDF7EF3
        for <linux-usb@vger.kernel.org>; Sun, 26 Feb 2023 13:33:44 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C5CD8B80B7E
        for <linux-usb@vger.kernel.org>; Sun, 26 Feb 2023 21:33:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7D793C433D2
        for <linux-usb@vger.kernel.org>; Sun, 26 Feb 2023 21:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677447221;
        bh=0D0d934HA57Jus1njjiNvyCG2nCC2ELUdfJ0FdR8pyE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=AbYZjsEEA/HxGEuRHYWV1pb5xlHyKv3wwkXhAaeFy4hkAtg+RtxAngiH/yJ3NR7T/
         2LwsCZNea4MjRgexVRxG5BlhYFCjG8Z0FM77KA8CdobpvKjnNbPgGJMeMXQWYbclDC
         4zqsLaJUPRAdnXp5C6+7hicFcXnLTuRc2ZDxuBZMZ+pvD7WIFLUUNcvlQonsDOiTYx
         PZ7yrU1BiNeMF2hheX1+ERx4MGXW6o8odDkytI8iaNw01+VlwN84iMkJ7EVqjVFbh4
         vU2jdG8Ae+0A103nUZURVsYCC5qtDia9cB/K+F3+DEIZzyiHq8x9y4vP3FTzp/zKCb
         01gLGCS/Sf/Dg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 643A4C43141; Sun, 26 Feb 2023 21:33:41 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217089] xone23c mixer
Date:   Sun, 26 Feb 2023 21:33:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kaufmich@valino.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217089-208809-Tw1dGVkh2J@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217089-208809@https.bugzilla.kernel.org/>
References: <bug-217089-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217089

--- Comment #2 from valino (kaufmich@valino.info) ---
dsmeg:

[44482.358193] usb 1-1.2: Product: Xone:23C
[44482.358199] usb 1-1.2: Manufacturer: Allen&Heath
[44482.358205] usb 1-1.2: SerialNumber: no serial number
[44482.361222] usb 1-1.2: 1:2 : UAC_AS_GENERAL descriptor not found
[44482.362519] usb 1-1.2: 2:2 : UAC_AS_GENERAL descriptor not found

lsusb -v -d 22f0:0008~

Bus 001 Device 011: ID 22f0:0008 Allen&Heath Xone:23C
Couldn't open device, some information will be missing
Device Descriptor:
bLength 18
bDescriptorType 1
bcdUSB 2.00
bDeviceClass 239 Miscellaneous Device
bDeviceSubClass 2
bDeviceProtocol 1 Interface Association
bMaxPacketSize0 64
idVendor 0x22f0
idProduct 0x0008
bcdDevice 2.00
iManufacturer 1 Allen&Heath
iProduct 2 Xone:23C
iSerial 3 no serial number
bNumConfigurations 1
Configuration Descriptor:
bLength 9
bDescriptorType 2
wTotalLength 0x0126
bNumInterfaces 4
bConfigurationValue 1
iConfiguration 0
bmAttributes 0xc0
Self Powered
MaxPower 0mA
Interface Descriptor:
bLength 9
bDescriptorType 4
bInterfaceNumber 0
bAlternateSetting 0
bNumEndpoints 0
bInterfaceClass 1 Audio
bInterfaceSubClass 1 Control Device
bInterfaceProtocol 0
iInterface 0
AudioControl Interface Descriptor:
bLength 11
bDescriptorType 36
bDescriptorSubtype 1 (HEADER)
bcdADC 1.00
wTotalLength 0x0035
bInCollection 3
baInterfaceNr(0) 1
baInterfaceNr(1) 2
baInterfaceNr(2) 3
AudioControl Interface Descriptor:
bLength 12
bDescriptorType 36
bDescriptorSubtype 2 (INPUT_TERMINAL)
bTerminalID 1
wTerminalType 0x0101 USB Streaming
bAssocTerminal 0
bNrChannels 2
wChannelConfig 0x0003
Left Front (L)
Right Front (R)
iChannelNames 0
iTerminal 0
AudioControl Interface Descriptor:
bLength 9
bDescriptorType 36
bDescriptorSubtype 3 (OUTPUT_TERMINAL)
bTerminalID 2
wTerminalType 0x0602 Digital Audio Interface
bAssocTerminal 0
bSourceID 1
iTerminal 0
AudioControl Interface Descriptor:
bLength 12
bDescriptorType 36
bDescriptorSubtype 2 (INPUT_TERMINAL)
bTerminalID 3
wTerminalType 0x0602 Digital Audio Interface
bAssocTerminal 0
bNrChannels 2
wChannelConfig 0x0003
Left Front (L)
Right Front (R)
iChannelNames 0
iTerminal 0
AudioControl Interface Descriptor:
bLength 9
bDescriptorType 36
bDescriptorSubtype 3 (OUTPUT_TERMINAL)
bTerminalID 4
wTerminalType 0x0101 USB Streaming
bAssocTerminal 0
bSourceID 3
iTerminal 0
Interface Descriptor:
bLength 9
bDescriptorType 4
bInterfaceNumber 1
bAlternateSetting 0
bNumEndpoints 0
bInterfaceClass 1 Audio
bInterfaceSubClass 2 Streaming
bInterfaceProtocol 0
iInterface 0
Interface Descriptor:
bLength 9
bDescriptorType 4
bInterfaceNumber 1
bAlternateSetting 1
bNumEndpoints 2
bInterfaceClass 1 Audio
bInterfaceSubClass 2 Streaming
bInterfaceProtocol 0
iInterface 0
AudioStreaming Interface Descriptor:
bLength 7
bDescriptorType 36
bDescriptorSubtype 1 (AS_GENERAL)
bTerminalLink 1
bDelay 1 frames
wFormatTag 0x0001 PCM
AudioStreaming Interface Descriptor:
bLength 11
bDescriptorType 36
bDescriptorSubtype 2 (FORMAT_TYPE)
bFormatType 1 (FORMAT_TYPE_I)
bNrChannels 2
bSubframeSize 3
bBitResolution 24
bSamFreqType 1 Discrete
tSamFreq[ 0] 48000
Endpoint Descriptor:
bLength 9
bDescriptorType 5
bEndpointAddress 0x02 EP 2 OUT
bmAttributes 5
Transfer Type Isochronous
Synch Type Asynchronous
Usage Type Data
wMaxPacketSize 0x0126 1x 294 bytes
bInterval 4
bRefresh 0
bSynchAddress 133
AudioStreaming Endpoint Descriptor:
bLength 7
bDescriptorType 37
bDescriptorSubtype 1 (EP_GENERAL)
bmAttributes 0x01
Sampling Frequency
bLockDelayUnits 2 Decoded PCM samples
wLockDelay 0x0000
Endpoint Descriptor:
bLength 9
bDescriptorType 5
bEndpointAddress 0x85 EP 5 IN
bmAttributes 1
Transfer Type Isochronous
Synch Type None
Usage Type Data
wMaxPacketSize 0x0003 1x 3 bytes
bInterval 4
bRefresh 5
bSynchAddress 0
Interface Descriptor:
bLength 9
bDescriptorType 4
bInterfaceNumber 1
bAlternateSetting 2
bNumEndpoints 1
bInterfaceClass 255 Vendor Specific Class
bInterfaceSubClass 0
bInterfaceProtocol 0
iInterface 0
Endpoint Descriptor:
bLength 9
bDescriptorType 5
bEndpointAddress 0x02 EP 2 OUT
bmAttributes 5
Transfer Type Isochronous
Synch Type Asynchronous
Usage Type Data
wMaxPacketSize 0x0200 1x 512 bytes
bInterval 1
bRefresh 0
bSynchAddress 0
Interface Descriptor:
bLength 9
bDescriptorType 4
bInterfaceNumber 2
bAlternateSetting 0
bNumEndpoints 0
bInterfaceClass 1 Audio
bInterfaceSubClass 2 Streaming
bInterfaceProtocol 0
iInterface 0
Interface Descriptor:
bLength 9
bDescriptorType 4
bInterfaceNumber 2
bAlternateSetting 1
bNumEndpoints 1
bInterfaceClass 1 Audio
bInterfaceSubClass 2 Streaming
bInterfaceProtocol 0
iInterface 0
AudioStreaming Interface Descriptor:
bLength 7
bDescriptorType 36
bDescriptorSubtype 1 (AS_GENERAL)
bTerminalLink 4
bDelay 1 frames
wFormatTag 0x0001 PCM
AudioStreaming Interface Descriptorlsusb -v -d 22f0:0008~

Bus 001 Device 011: ID 22f0:0008 Allen&Heath Xone:23C
Couldn't open device, some information will be missing
Device Descriptor:
bLength 18
bDescriptorType 1
bcdUSB 2.00
bDeviceClass 239 Miscellaneous Device
bDeviceSubClass 2
bDeviceProtocol 1 Interface Association
bMaxPacketSize0 64
idVendor 0x22f0
idProduct 0x0008
bcdDevice 2.00
iManufacturer 1 Allen&Heath
iProduct 2 Xone:23C
iSerial 3 no serial number
bNumConfigurations 1
Configuration Descriptor:
bLength 9
bDescriptorType 2
wTotalLength 0x0126
bNumInterfaces 4
bConfigurationValue 1
iConfiguration 0
bmAttributes 0xc0
Self Powered
MaxPower 0mA
Interface Descriptor:
bLength 9
bDescriptorType 4
bInterfaceNumber 0
bAlternateSetting 0
bNumEndpoints 0
bInterfaceClass 1 Audio
bInterfaceSubClass 1 Control Device
bInterfaceProtocol 0
iInterface 0
AudioControl Interface Descriptor:
bLength 11
bDescriptorType 36
bDescriptorSubtype 1 (HEADER)
bcdADC 1.00
wTotalLength 0x0035
bInCollection 3
baInterfaceNr(0) 1
baInterfaceNr(1) 2
baInterfaceNr(2) 3
AudioControl Interface Descriptor:
bLength 12
bDescriptorType 36
bDescriptorSubtype 2 (INPUT_TERMINAL)
bTerminalID 1
wTerminalType 0x0101 USB Streaming
bAssocTerminal 0
bNrChannels 2
wChannelConfig 0x0003
Left Front (L)
Right Front (R)
iChannelNames 0
iTerminal 0
AudioControl Interface Descriptor:
bLength 9
bDescriptorType 36
bDescriptorSubtype 3 (OUTPUT_TERMINAL)
bTerminalID 2
wTerminalType 0x0602 Digital Audio Interface
bAssocTerminal 0
bSourceID 1
iTerminal 0
AudioControl Interface Descriptor:
bLength 12
bDescriptorType 36
bDescriptorSubtype 2 (INPUT_TERMINAL)
bTerminalID 3
wTerminalType 0x0602 Digital Audio Interface
bAssocTerminal 0
bNrChannels 2
wChannelConfig 0x0003
Left Front (L)
Right Front (R)
iChannelNames 0
iTerminal 0
AudioControl Interface Descriptor:
bLength 9
bDescriptorType 36
bDescriptorSubtype 3 (OUTPUT_TERMINAL)
bTerminalID 4
wTerminalType 0x0101 USB Streaming
bAssocTerminal 0
bSourceID 3
iTerminal 0
Interface Descriptor:
bLength 9
bDescriptorType 4
bInterfaceNumber 1
bAlternateSetting 0
bNumEndpoints 0
bInterfaceClass 1 Audio
bInterfaceSubClass 2 Streaming
bInterfaceProtocol 0
iInterface 0
Interface Descriptor:
bLength 9
bDescriptorType 4
bInterfaceNumber 1
bAlternateSetting 1
bNumEndpoints 2
bInterfaceClass 1 Audio
bInterfaceSubClass 2 Streaming
bInterfaceProtocol 0
iInterface 0
AudioStreaming Interface Descriptor:
bLength 7
bDescriptorType 36
bDescriptorSubtype 1 (AS_GENERAL)
bTerminalLink 1
bDelay 1 frames
wFormatTag 0x0001 PCM
AudioStreaming Interface Descriptor:
bLength 11
bDescriptorType 36
bDescriptorSubtype 2 (FORMAT_TYPE)
bFormatType 1 (FORMAT_TYPE_I)
bNrChannels 2
bSubframeSize 3
bBitResolution 24
bSamFreqType 1 Discrete
tSamFreq[ 0] 48000
Endpoint Descriptor:
bLength 9
bDescriptorType 5
bEndpointAddress 0x02 EP 2 OUT
bmAttributes 5
Transfer Type Isochronous
Synch Type Asynchronous
Usage Type Data
wMaxPacketSize 0x0126 1x 294 bytes
bInterval 4
bRefresh 0
bSynchAddress 133
AudioStreaming Endpoint Descriptor:
bLength 7
bDescriptorType 37
bDescriptorSubtype 1 (EP_GENERAL)
bmAttributes 0x01
Sampling Frequency
bLockDelayUnits 2 Decoded PCM samples
wLockDelay 0x0000
Endpoint Descriptor:
bLength 9
bDescriptorType 5
bEndpointAddress 0x85 EP 5 IN
bmAttributes 1
Transfer Type Isochronous
Synch Type None
Usage Type Data
wMaxPacketSize 0x0003 1x 3 bytes
bInterval 4
bRefresh 5
bSynchAddress 0
Interface Descriptor:
bLength 9
bDescriptorType 4
bInterfaceNumber 1
bAlternateSetting 2
bNumEndpoints 1
bInterfaceClass 255 Vendor Specific Class
bInterfaceSubClass 0
bInterfaceProtocol 0
iInterface 0
Endpoint Descriptor:
bLength 9
bDescriptorType 5
bEndpointAddress 0x02 EP 2 OUT
bmAttributes 5
Transfer Type Isochronous
Synch Type Asynchronous
Usage Type Data
wMaxPacketSize 0x0200 1x 512 bytes
bInterval 1
bRefresh 0
bSynchAddress 0
Interface Descriptor:
bLength 9
bDescriptorType 4
bInterfaceNumber 2
bAlternateSetting 0
bNumEndpoints 0
bInterfaceClass 1 Audio
bInterfaceSubClass 2 Streaming
bInterfaceProtocol 0
iInterface 0
Interface Descriptor:
bLength 9
bDescriptorType 4
bInterfaceNumber 2
bAlternateSetting 1
bNumEndpoints 1
bInterfaceClass 1 Audio
bInterfaceSubClass 2 Streaming
bInterfaceProtocol 0
iInterface 0
AudioStreaming Interface Descriptor:
bLength 7
bDescriptorType 36
bDescriptorSubtype 1 (AS_GENERAL)
bTerminalLink 4
bDelay 1 frames
wFormatTag 0x0001 PCM
AudioStreaming Interface Descriptor:
bLength 11
bDescriptorType 36
bDescriptorSubtype 2 (FORMAT_TYPE)
bFormatType 1 (FORMAT_TYPE_I)
bNrChannels 2
bSubframeSize 3
bBitResolution 24
bSamFreqType 1 Discrete
tSamFreq[ 0] 48000
Endpoint Descriptor:
bLength 9
bDescriptorType 5
bEndpointAddress 0x81 EP 1 IN
bmAttributes 5
Transfer Type Isochronous
Synch Type Asynchronous
Usage Type Data
wMaxPacketSize 0x0126 1x 294 bytes
bInterval 4
bRefresh 0
bSynchAddress 0
AudioStreaming Endpoint Descriptor:
bLength 7
bDescriptorType 37
bDescriptorSubtype 1 (EP_GENERAL)
bmAttributes 0x01
Sampling Frequency
bLockDelayUnits 2 Decoded PCM samples
wLockDelay 0x0000
Interface Descriptor:
bLength 9
bDescriptorType 4
bInterfaceNumber 2
bAlternateSetting 2
bNumEndpoints 1
bInterfaceClass 255 Vendor Specific Class
bInterfaceSubClass 0
bInterfaceProtocol 0
iInterface 0
Endpoint Descriptor:
bLength 9
bDescriptorType 5
bEndpointAddress 0x81 EP 1 IN
bmAttributes 5
Transfer Type Isochronous
Synch Type Asynchronous
Usage Type Data
wMaxPacketSize 0x0200 1x 512 bytes
bInterval 1
bRefresh 0
bSynchAddress 0
Interface Descriptor:
bLength 9
bDescriptorType 4
bInterfaceNumber 3
bAlternateSetting 0
bNumEndpoints 2
bInterfaceClass 1 Audio
bInterfaceSubClass 3 MIDI Streaming
bInterfaceProtocol 0
iInterface 0
MIDIStreaming Interface Descriptor:
bLength 7
bDescriptorType 36
bDescriptorSubtype 1 (HEADER)
bcdADC 1.00
wTotalLength 0x0041
MIDIStreaming Interface Descriptor:
bLength 6
bDescriptorType 36
bDescriptorSubtype 2 (MIDI_IN_JACK)
bJackType 1 Embedded
bJackID 1
iJack 0
MIDIStreaming Interface Descriptor:
bLength 6
bDescriptorType 36
bDescriptorSubtype 2 (MIDI_IN_JACK)
bJackType 2 External
bJackID 2
iJack 0
MIDIStreaming Interface Descriptor:
bLength 9
bDescriptorType 36
bDescriptorSubtype 3 (MIDI_OUT_JACK)
bJackType 1 Embedded
bJackID 3
bNrInputPins 1
baSourceID( 0) 2
BaSourcePin( 0) 1
iJack 0
MIDIStreaming Interface Descriptor:
bLength 9
bDescriptorType 36
bDescriptorSubtype 3 (MIDI_OUT_JACK)
bJackType 2 External
bJackID 4
bNrInputPins 1
baSourceID( 0) 1
BaSourcePin( 0) 1
iJack 0
Endpoint Descriptor:
bLength 9
bDescriptorType 5
bEndpointAddress 0x83 EP 3 IN
bmAttributes 2
Transfer Type Bulk
Synch Type None
Usage Type Data
wMaxPacketSize 0x0200 1x 512 bytes
bInterval 1
bRefresh 0
bSynchAddress 0
MIDIStreaming Endpoint Descriptor:
bLength 5
bDescriptorType 37
bDescriptorSubtype 1 (GENERAL)
bNumEmbMIDIJack 1
baAssocJackID( 0) 3
Endpoint Descriptor:
bLength 9
bDescriptorType 5
bEndpointAddress 0x04 EP 4 OUT
bmAttributes 3
Transfer Type Interrupt
Synch Type None
Usage Type Data
wMaxPacketSize 0x0010 1x 16 bytes
bInterval 4
bRefresh 0
bSynchAddress 0
MIDIStreaming Endpoint Descriptor:
bLength 5
bDescriptorType 37
bDescriptorSubtype 1 (GENERAL)
bNumEmbMIDIJack 1
baAssocJackID( 0) 1
:
bLength 11
bDescriptorType 36
bDescriptorSubtype 2 (FORMAT_TYPE)
bFormatType 1 (FORMAT_TYPE_I)
bNrChannels 2
bSubframeSize 3
bBitResolution 24
bSamFreqType 1 Discrete
tSamFreq[ 0] 48000
Endpoint Descriptor:
bLength 9
bDescriptorType 5
bEndpointAddress 0x81 EP 1 IN
bmAttributes 5
Transfer Type Isochronous
Synch Type Asynchronous
Usage Type Data
wMaxPacketSize 0x0126 1x 294 bytes
bInterval 4
bRefresh 0
bSynchAddress 0
AudioStreaming Endpoint Descriptor:
bLength 7
bDescriptorType 37
bDescriptorSubtype 1 (EP_GENERAL)
bmAttributes 0x01
Sampling Frequency
bLockDelayUnits 2 Decoded PCM samples
wLockDelay 0x0000
Interface Descriptor:
bLength 9
bDescriptorType 4
bInterfaceNumber 2
bAlternateSetting 2
bNumEndpoints 1
bInterfaceClass 255 Vendor Specific Class
bInterfaceSubClass 0
bInterfaceProtocol 0
iInterface 0
Endpoint Descriptor:
bLength 9
bDescriptorType 5
bEndpointAddress 0x81 EP 1 IN
bmAttributes 5
Transfer Type Isochronous
Synch Type Asynchronous
Usage Type Data
wMaxPacketSize 0x0200 1x 512 bytes
bInterval 1
bRefresh 0
bSynchAddress 0
Interface Descriptor:
bLength 9
bDescriptorType 4
bInterfaceNumber 3
bAlternateSetting 0
bNumEndpoints 2
bInterfaceClass 1 Audio
bInterfaceSubClass 3 MIDI Streaming
bInterfaceProtocol 0
iInterface 0
MIDIStreaming Interface Descriptor:
bLength 7
bDescriptorType 36
bDescriptorSubtype 1 (HEADER)
bcdADC 1.00
wTotalLength 0x0041
MIDIStreaming Interface Descriptor:
bLength 6
bDescriptorType 36
bDescriptorSubtype 2 (MIDI_IN_JACK)
bJackType 1 Embedded
bJackID 1
iJack 0
MIDIStreaming Interface Descriptor:
bLength 6
bDescriptorType 36
bDescriptorSubtype 2 (MIDI_IN_JACK)
bJackType 2 External
bJackID 2
iJack 0
MIDIStreaming Interface Descriptor:
bLength 9
bDescriptorType 36
bDescriptorSubtype 3 (MIDI_OUT_JACK)
bJackType 1 Embedded
bJackID 3
bNrInputPins 1
baSourceID( 0) 2
BaSourcePin( 0) 1
iJack 0
MIDIStreaming Interface Descriptor:
bLength 9
bDescriptorType 36
bDescriptorSubtype 3 (MIDI_OUT_JACK)
bJackType 2 External
bJackID 4
bNrInputPins 1
baSourceID( 0) 1
BaSourcePin( 0) 1
iJack 0
Endpoint Descriptor:
bLength 9
bDescriptorType 5
bEndpointAddress 0x83 EP 3 IN
bmAttributes 2
Transfer Type Bulk
Synch Type None
Usage Type Data
wMaxPacketSize 0x0200 1x 512 bytes
bInterval 1
bRefresh 0
bSynchAddress 0
MIDIStreaming Endpoint Descriptor:
bLength 5
bDescriptorType 37
bDescriptorSubtype 1 (GENERAL)
bNumEmbMIDIJack 1
baAssocJackID( 0) 3
Endpoint Descriptor:
bLength 9
bDescriptorType 5
bEndpointAddress 0x04 EP 4 OUT
bmAttributes 3
Transfer Type Interrupt
Synch Type None
Usage Type Data
wMaxPacketSize 0x0010 1x 16 bytes
bInterval 4
bRefresh 0
bSynchAddress 0
MIDIStreaming Endpoint Descriptor:
bLength 5
bDescriptorType 37
bDescriptorSubtype 1 (GENERAL)
bNumEmbMIDIJack 1
baAssocJackID( 0) 1

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
