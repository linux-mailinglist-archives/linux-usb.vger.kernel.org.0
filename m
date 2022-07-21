Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1302857C769
	for <lists+linux-usb@lfdr.de>; Thu, 21 Jul 2022 11:18:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231566AbiGUJSo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Jul 2022 05:18:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232764AbiGUJSj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 21 Jul 2022 05:18:39 -0400
X-Greylist: delayed 598 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 21 Jul 2022 02:18:38 PDT
Received: from 8.mo583.mail-out.ovh.net (8.mo583.mail-out.ovh.net [178.32.116.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E05BE7C1A4
        for <linux-usb@vger.kernel.org>; Thu, 21 Jul 2022 02:18:38 -0700 (PDT)
Received: from player773.ha.ovh.net (unknown [10.108.16.60])
        by mo583.mail-out.ovh.net (Postfix) with ESMTP id 8F55F217A6
        for <linux-usb@vger.kernel.org>; Thu, 21 Jul 2022 08:58:58 +0000 (UTC)
Received: from milecki.pl (ip-194-187-74-233.konfederacka.maverick.com.pl [194.187.74.233])
        (Authenticated sender: rafal@milecki.pl)
        by player773.ha.ovh.net (Postfix) with ESMTPSA id E3D192CE75C51;
        Thu, 21 Jul 2022 08:58:53 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-105G0069623f817-eba1-493d-9f6d-faa586e0ab02,
                    4F8F0815921DC4C4DF730CF433F9CF6218F2913D) smtp.auth=rafal@milecki.pl
X-OVh-ClientIp: 194.187.74.233
Message-ID: <437d6789-9ec0-fe4d-861a-5564dd291c39@milecki.pl>
Date:   Thu, 21 Jul 2022 10:58:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: dt-bindings: generic-ehci.yaml doesn't work well with usb-hcd.yaml
To:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc:     linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Florian Fainelli <f.fainelli@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 1536290426814245690
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudelledguddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfhffuvfevtgfgsehtjeertddtfeejnecuhfhrohhmpeftrghfrghlucfoihhlvggtkhhiuceorhgrfhgrlhesmhhilhgvtghkihdrphhlqeenucggtffrrghtthgvrhhnpeegkeejieejueekjeegheetveefhfdvtdduuddtjeevteetvdejjeejffeiveelgfenucfkpheptddrtddrtddrtddpudelgedrudekjedrjeegrddvfeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehplhgrhigvrhejjeefrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheprhgrfhgrlhesmhhilhgvtghkihdrphhlpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidquhhssgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheekfe
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

I'm trying to fix ARCH_BCM_5301X=y + "dtbs_check" error:

arch/arm/boot/dts/bcm4708-netgear-r6300-v2.dtb: usb@21000: '#address-cells', '#size-cells', '#usb-cells', 'port@1', 'port@2' do not match any of the regexes: 'pinctrl-[0-9]+'
         From schema: Documentation/devicetree/bindings/usb/generic-ehci.yaml

that comes from:

usb@21000 {
	#usb-cells = <0>;

	compatible = "generic-ehci";
	reg = <0x00021000 0x1000>;
	interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
	phys = <&usb2_phy>;

	#address-cells = <1>;
	#size-cells = <0>;

	ehci_port1: port@1 {
		reg = <1>;
		#trigger-source-cells = <0>;
	};

	ehci_port2: port@2 {
		reg = <2>;
		#trigger-source-cells = <0>;
	};
};

##########

If you check Documentation/devicetree/bindings/usb/generic-ehci.yaml it does:

allOf:
   - $ref: "usb-hcd.yaml"


In the usb-hcd.yaml there is:

properties:
   "#address-cells":
     const: 1

   "#size-cells":
     const: 0

patternProperties:
   "^.*@[0-9a-f]{1,2}$":
     description: The hard wired USB devices
     type: object
     $ref: /schemas/usb/usb-device.yaml

##########

So all looks good at first sight. I guess it's some problem with $ref /
additionalProperties / unevaluatedProperties.

I thought that generic-ehci.yaml should do:
unevaluatedProperties: false
instead of:
additionalProperties: false

but that doesn't help:
arch/arm/boot/dts/bcm4708-netgear-r6300-v2.dtb: usb@21000: Unevaluated properties are not allowed ('#usb-cells', '#address-cells', '#size-cells', 'port@1', 'port@2' were unexpected)
         From schema: Documentation/devicetree/bindings/usb/generic-ehci.yaml

The same seems to apply to generic-ohci.yaml and generic-xhci.yaml .

Could someone help me fixing that, please?
