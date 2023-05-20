Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE62370A4E4
	for <lists+linux-usb@lfdr.de>; Sat, 20 May 2023 05:25:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229522AbjETDZJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 19 May 2023 23:25:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjETDZF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 May 2023 23:25:05 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3D96E18C;
        Fri, 19 May 2023 20:25:02 -0700 (PDT)
Received: from loongson.cn (unknown [10.20.42.35])
        by gateway (Coremail) with SMTP id _____8AxmOmNPWhkoVcKAA--.18126S3;
        Sat, 20 May 2023 11:25:01 +0800 (CST)
Received: from [10.20.42.35] (unknown [10.20.42.35])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8BxWdKJPWhkkBhrAA--.49774S3;
        Sat, 20 May 2023 11:24:59 +0800 (CST)
Subject: Re: [PATCH v1] usb: dwc2: add pci_device_id driver_data parse support
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Minas Harutyunyan <hminas@synopsys.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, Jianmin Lv <lvjianmin@loongson.cn>,
        wanghongliang@loongson.cn, Liu Peibao <liupeibao@loongson.cn>,
        loongson-kernel@lists.loongnix.cn, zhuyinbo@loongson.cn
References: <20230518092240.8023-1-zhuyinbo@loongson.cn>
 <2023051843-scruffy-gush-cdec@gregkh>
From:   zhuyinbo <zhuyinbo@loongson.cn>
Message-ID: <aeaebb8c-e077-4678-62df-d80baff16347@loongson.cn>
Date:   Sat, 20 May 2023 11:24:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <2023051843-scruffy-gush-cdec@gregkh>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8BxWdKJPWhkkBhrAA--.49774S3
X-CM-SenderInfo: 52kx5xhqerqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvJXoW3Gr18XFWUtw1kWw47Zw15twb_yoW3KF1fpF
        ZrZayjkrWDtr1qkw13uF4DZFy5Aan3t342kF17K34S9r92vrn5WFy0k3sxCr93trWYq3W2
        vFy2qrs5uF47JaDanT9S1TB71UUUUj7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        bDkFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUXVWUAwA2ocxC64
        kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28E
        F7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJw
        A2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAaw2AFwI0_JF0_Jw1le2I262IYc4CY
        6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrV
        C2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE
        7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487MxkF7I0En4kS14
        v26r126r1DMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_WwCFx2IqxVCFs4IE
        7xkEbVWUJVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r1j6r18MI8I3I
        0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAI
        cVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcV
        CF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIE
        c7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8FAp5UUUUU==
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_SBL_CSS,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi greg k-h,

I'm sorry for giving you feedback so late, for your suggestion that I
have a some analysis.

2023 May 18, 2023 at 6:32 PM, Greg Kroah-Hartman wrote:
> On Thu, May 18, 2023 at 05:22:40PM +0800, Yinbo Zhu wrote:
>> The dwc2 driver has everything we need to run in PCI mode except
>> for pci_device_id driver_data parse.  With that to set Loongson
>> dwc2 element and added identified as PCI_VENDOR_ID_LOONGSON
>> and PCI_DEVICE_ID_LOONGSON_DWC2 in dwc2_pci_ids, the Loongson
>> dwc2 controller will work.
>>
>> Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
>> ---
>>   drivers/usb/dwc2/core.h   |  1 +
>>   drivers/usb/dwc2/params.c | 33 +++++++++++++++++++++++++++++++--
>>   drivers/usb/dwc2/pci.c    | 14 +-------------
>>   include/linux/pci_ids.h   |  2 ++
>>   4 files changed, 35 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
>> index 0bb4c0c845bf..c92a1da46a01 100644
>> --- a/drivers/usb/dwc2/core.h
>> +++ b/drivers/usb/dwc2/core.h
>> @@ -1330,6 +1330,7 @@ irqreturn_t dwc2_handle_common_intr(int irq, void *dev);
>>   /* The device ID match table */
>>   extern const struct of_device_id dwc2_of_match_table[];
>>   extern const struct acpi_device_id dwc2_acpi_match[];
>> +extern const struct pci_device_id dwc2_pci_ids[];
>>   
>>   int dwc2_lowlevel_hw_enable(struct dwc2_hsotg *hsotg);
>>   int dwc2_lowlevel_hw_disable(struct dwc2_hsotg *hsotg);
>> diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
>> index 21d16533bd2f..f7550d293c2d 100644
>> --- a/drivers/usb/dwc2/params.c
>> +++ b/drivers/usb/dwc2/params.c
>> @@ -7,6 +7,8 @@
>>   #include <linux/module.h>
>>   #include <linux/of_device.h>
>>   #include <linux/usb/of.h>
>> +#include <linux/pci_ids.h>
>> +#include <linux/pci.h>
>>   
>>   #include "core.h"
>>   
>> @@ -55,6 +57,14 @@ static void dwc2_set_jz4775_params(struct dwc2_hsotg *hsotg)
>>   		!device_property_read_bool(hsotg->dev, "disable-over-current");
>>   }
>>   
>> +static void dwc2_set_loongson_params(struct dwc2_hsotg *hsotg)
>> +{
>> +	struct dwc2_core_params *p = &hsotg->params;
>> +
>> +	p->phy_utmi_width = 8;
>> +	p->power_down = DWC2_POWER_DOWN_PARAM_NONE;
>> +}
>> +
>>   static void dwc2_set_x1600_params(struct dwc2_hsotg *hsotg)
>>   {
>>   	struct dwc2_core_params *p = &hsotg->params;
>> @@ -281,6 +291,22 @@ const struct acpi_device_id dwc2_acpi_match[] = {
>>   };
>>   MODULE_DEVICE_TABLE(acpi, dwc2_acpi_match);
>>   
>> +const struct pci_device_id dwc2_pci_ids[] = {
>> +	{
>> +		PCI_DEVICE(PCI_VENDOR_ID_SYNOPSYS, PCI_PRODUCT_ID_HAPS_HSOTG),
>> +	},
>> +	{
>> +		PCI_DEVICE(PCI_VENDOR_ID_STMICRO,
>> +			   PCI_DEVICE_ID_STMICRO_USB_OTG),
>> +	},
>> +	{
>> +		PCI_DEVICE(PCI_VENDOR_ID_LOONGSON, PCI_DEVICE_ID_LOONGSON_DWC2),
>> +		.driver_data = (unsigned long)dwc2_set_loongson_params,
>> +	},
>> +	{ /* end: all zeroes */ }
>> +};
>> +MODULE_DEVICE_TABLE(pci, dwc2_pci_ids);
>> +
>>   static void dwc2_set_param_otg_cap(struct dwc2_hsotg *hsotg)
>>   {
>>   	switch (hsotg->hw_params.op_mode) {
>> @@ -929,10 +955,13 @@ int dwc2_init_params(struct dwc2_hsotg *hsotg)
>>   		set_params(hsotg);
>>   	} else {
>>   		const struct acpi_device_id *amatch;
>> +		const struct pci_device_id *pmatch;
>>   
>>   		amatch = acpi_match_device(dwc2_acpi_match, hsotg->dev);
>> -		if (amatch && amatch->driver_data) {
>> -			set_params = (set_params_cb)amatch->driver_data;
>> +		pmatch = pci_match_id(dwc2_pci_ids, to_pci_dev(hsotg->dev->parent));
> 
> Ick, this means this is not a "real" PCI driver, right?  Why not?


The params.c and platform.c was a part of pci dwc2 device driver. This 
pci.c was only play a role that register device resource but not operate
dwc2 hardware.  in other words, the params.c seems unrelated to the 
device type.  Whether this device is a PCI device, platform device, or 
PCI device, it is best to use params.c for operational dwc2 elements.
Failure to do so seems to break the original design.

> 
> Please tie into the PCI device probe call, don't walk all PCI devices
> like this.


I learn about that you strongly disagree with using pci_match_id, May
I ask you the reason ?  actually, I use it was due to I noticed that
xhci-pci.c, ehci-pci.c and ohci-pci.c was all use it. and I don't use it
in dwc2/pci.c was considering set dwc2 element need dpend on elements.c
and platform.c, and usb driver (ohci,echi,xhci) was a relatively
indepent device driver when to operate usb controler. but dwc2 was not.

If I fource the element setting of dwc2 element in dwc2/pci.c. It will 
be following case. This will cause problems with element-initial
function or element-check function.

1. initial dwc2 element.
2. check the setting of dwc2 element whether was suitable
3. set dwc2 element.

or

1. set dwc2 element.
2. initial dwc2 element.
3. check the setting of dwc2 element whether was suitable

The corresponding code call process as follows:

1. dwc2_set_default_params(hsotg);
2. dwc2_get_device_properties(hsotg);
3. dwc2_check_params(hsotg);
4. dwc2_set_loongson_params;

or

1. dwc2_set_loongson_params;
2. dwc2_set_default_params(hsotg);
3. dwc2_get_device_properties(hsotg);
4. dwc2_check_params(hsotg);

But the platform dwc2 device or acpi dwc2 device was all following case
and It seems was correct order.

1. dwc2_set_default_params(hsotg);
2. dwc2_get_device_properties(hsotg);
3. dwc2_set_loongson_params;
4. dwc2_check_params(hsotg);

> 
> How are you _sure_ that the parent is really a PCI device?  That is very
> very fragile and will break.
> 
> Do this properly instead.


Thank you for your reminder. There was indeed an issue with my previous
code, and the modified code is as follows, then it seems to ensure that
device is a PCI device.

@@ -927,13 +954,20 @@ int dwc2_init_params(struct dwc2_hsotg *hsotg)
         if (match && match->data) {
                 set_params = match->data;
                 set_params(hsotg);
-       } else {
+       } else if (!match) {
                 const struct acpi_device_id *amatch;
+               const struct pci_device_id *pmatch = NULL;

                 amatch = acpi_match_device(dwc2_acpi_match, hsotg->dev);
                 if (amatch && amatch->driver_data) {
                         set_params = (set_params_cb)amatch->driver_data;
                         set_params(hsotg);
+               } else if (!amatch)
+                       pmatch = pci_match_id(dwc2_pci_ids,
					to_pci_dev(hsotg->dev->parent));
+
+               if (pmatch && pmatch->driver_data) {
+                       set_params = (set_params_cb)pmatch->driver_data;
+                       set_params(hsotg);
                 }

> 
> 
>> +
>> +		if ((amatch && amatch->driver_data) || (pmatch && pmatch->driver_data)) {
>> +			set_params = (set_params_cb)pmatch->driver_data;
>>   			set_params(hsotg);
>>   		}
>>   	}
>> diff --git a/drivers/usb/dwc2/pci.c b/drivers/usb/dwc2/pci.c
>> index b7306ed8be4c..f3a1e4232a31 100644
>> --- a/drivers/usb/dwc2/pci.c
>> +++ b/drivers/usb/dwc2/pci.c
>> @@ -24,7 +24,7 @@
>>   #include <linux/platform_device.h>
>>   #include <linux/usb/usb_phy_generic.h>
>>   
>> -#define PCI_PRODUCT_ID_HAPS_HSOTG	0xabc0
>> +#include "core.h"
>>   
>>   static const char dwc2_driver_name[] = "dwc2-pci";
>>   
>> @@ -122,18 +122,6 @@ static int dwc2_pci_probe(struct pci_dev *pci,
>>   	return ret;
>>   }
>>   
>> -static const struct pci_device_id dwc2_pci_ids[] = {
>> -	{
>> -		PCI_DEVICE(PCI_VENDOR_ID_SYNOPSYS, PCI_PRODUCT_ID_HAPS_HSOTG),
>> -	},
>> -	{
>> -		PCI_DEVICE(PCI_VENDOR_ID_STMICRO,
>> -			   PCI_DEVICE_ID_STMICRO_USB_OTG),
>> -	},
>> -	{ /* end: all zeroes */ }
>> -};
>> -MODULE_DEVICE_TABLE(pci, dwc2_pci_ids);
>> -
>>   static struct pci_driver dwc2_pci_driver = {
>>   	.name = dwc2_driver_name,
>>   	.id_table = dwc2_pci_ids,
>> diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
>> index e43ab203054a..6481f648695a 100644
>> --- a/include/linux/pci_ids.h
>> +++ b/include/linux/pci_ids.h
>> @@ -157,6 +157,7 @@
>>   #define PCI_VENDOR_ID_PCI_SIG		0x0001
>>   
>>   #define PCI_VENDOR_ID_LOONGSON		0x0014
>> +#define PCI_DEVICE_ID_LOONGSON_DWC2	0x7a04
>>   
>>   #define PCI_VENDOR_ID_SOLIDIGM		0x025e
>>   
>> @@ -2356,6 +2357,7 @@
>>   #define PCI_DEVICE_ID_SYNOPSYS_HAPSUSB3_AXI	0xabce
>>   #define PCI_DEVICE_ID_SYNOPSYS_HAPSUSB31	0xabcf
>>   #define PCI_DEVICE_ID_SYNOPSYS_EDDA	0xedda
>> +#define PCI_PRODUCT_ID_HAPS_HSOTG       0xabc0
> 
> Please read the top of this file for why you should not add new ids
> here.

okay, I will remove it.

Thanks!
Yinbo.

