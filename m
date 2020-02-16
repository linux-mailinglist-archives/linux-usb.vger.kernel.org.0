Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 022E616044B
	for <lists+linux-usb@lfdr.de>; Sun, 16 Feb 2020 15:15:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728234AbgBPOOp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 16 Feb 2020 09:14:45 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:30576 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728128AbgBPOOp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 16 Feb 2020 09:14:45 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1581862483; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=iJy8FFACfq+Kt+TGnUB9dsmTmuGqTJp6Rqzq41bek7c=; b=Ha9sQfU/+Xys4pmoY5WULOuGvCJ/+V+f+UprUudP7HHK09AdOmyB30/D3HAYy59TIdgWPN1U
 /rniYQO69qPX2MqmDu2tCNVBpUFT9fEYcx08ZyapjAPsVZrIQB+8bAeCD2dybC2phe/gNRST
 Zt4GONrO+MP0V+ZQBd6iZUDsR5U=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e494e51.7f0c62e76fb8-smtp-out-n01;
 Sun, 16 Feb 2020 14:14:41 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E0B5AC43383; Sun, 16 Feb 2020 14:14:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.100] (unknown [103.140.231.108])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akdwived)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9EB53C433A2;
        Sun, 16 Feb 2020 14:14:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9EB53C433A2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akdwived@codeaurora.org
Subject: Re: [PATCH v4 2/2] Embedded USB Debugger (EUD) driver
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ckadabi@codeaurora.org, tsoni@codeaurora.org,
        bryanh@codeaurora.org, psodagud@codeaurora.org,
        rnayak@codeaurora.org, satyap@codeaurora.org,
        pheragu@codeaurora.org
References: <1580445811-15948-1-git-send-email-akdwived@codeaurora.org>
 <1580445811-15948-3-git-send-email-akdwived@codeaurora.org>
 <20200203193533.GL3948@builder>
From:   "Dwivedi, Avaneesh Kumar (avani)" <akdwived@codeaurora.org>
Message-ID: <5808f959-f0fc-85be-4bfa-980b5311adeb@codeaurora.org>
Date:   Sun, 16 Feb 2020 19:44:33 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200203193533.GL3948@builder>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Thank you very much Bjorn for your comments, will address them and post 
latest patchset soon.

On 2/4/2020 1:05 AM, Bjorn Andersson wrote:
> On Thu 30 Jan 20:43 PST 2020, Avaneesh Kumar Dwivedi wrote:
>
>> Add support for control peripheral of EUD (Embedded USB Debugger) to
>> listen to events such as USB attach/detach, charger enable/disable, pet
>> EUD to indicate software is functional. Reusing the platform device kobj,
>> sysfs entry 'enable' is created to enable or disable EUD.
>>
>> Signed-off-by: Satya Durga Srinivasu Prabhala <satyap@codeaurora.org>
>> Signed-off-by: Prakruthi Deepak Heragu <pheragu@codeaurora.org>
>> Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
> Either ensure Satya is the author, or add some Co-developed-by to
> indicate that all three of you have authored the patch.
Will add Co-developed-by.
>
>> ---
>>   Documentation/ABI/stable/sysfs-driver-msm-eud |   5 +
>>   drivers/soc/qcom/Kconfig                      |  12 +
>>   drivers/soc/qcom/Makefile                     |   1 +
>>   drivers/soc/qcom/eud.c                        | 329 ++++++++++++++++++++++++++
>>   4 files changed, 347 insertions(+)
>>   create mode 100644 Documentation/ABI/stable/sysfs-driver-msm-eud
>>   create mode 100644 drivers/soc/qcom/eud.c
>>
>> diff --git a/Documentation/ABI/stable/sysfs-driver-msm-eud b/Documentation/ABI/stable/sysfs-driver-msm-eud
>> new file mode 100644
>> index 0000000..d96ae05
>> --- /dev/null
>> +++ b/Documentation/ABI/stable/sysfs-driver-msm-eud
>> @@ -0,0 +1,5 @@
>> +What:           /sys/bus/platform/drivers/msm-eud/enable
>> +Date:           Jan 2020
>> +Contact:        Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
>> +Description:    Enable/Disable use of eud device.
>> +Users:          User space debug application which intend to use EUD h/w block.
>> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
>> index d0a73e7..6b7c9d0 100644
>> --- a/drivers/soc/qcom/Kconfig
>> +++ b/drivers/soc/qcom/Kconfig
>> @@ -202,4 +202,16 @@ config QCOM_APR
>>   	  application processor and QDSP6. APR is
>>   	  used by audio driver to configure QDSP6
>>   	  ASM, ADM and AFE modules.
>> +
>> +config QCOM_EUD
> Please aim for keeping the sort order in this file (ignore QCOM_APR
> which obviously is in the wrong place)
Please help to elaborate more, do you mean adding configs in 
alphabetical order?
>
>> +       tristate "QTI Embedded USB Debugger (EUD)"
>> +       depends on ARCH_QCOM
>> +       help
>> +         The Embedded USB Debugger (EUD) driver is a driver for the
>> +         control peripheral which waits on events like USB attach/detach
>> +         and charger enable/disable. The control peripheral further helps
>> +         support the USB-based debug and trace capabilities.
>> +         This module enables support for Qualcomm Technologies, Inc.
>> +         Embedded USB Debugger (EUD).
>> +         If unsure, say N.
>>   endmenu
>> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
>> index 9fb35c8..c15be68 100644
>> --- a/drivers/soc/qcom/Makefile
>> +++ b/drivers/soc/qcom/Makefile
>> @@ -25,3 +25,4 @@ obj-$(CONFIG_QCOM_APR) += apr.o
>>   obj-$(CONFIG_QCOM_LLCC) += llcc-qcom.o
>>   obj-$(CONFIG_QCOM_RPMHPD) += rpmhpd.o
>>   obj-$(CONFIG_QCOM_RPMPD) += rpmpd.o
>> +obj-$(CONFIG_QCOM_EUD) += eud.o
>> diff --git a/drivers/soc/qcom/eud.c b/drivers/soc/qcom/eud.c
>> new file mode 100644
>> index 0000000..e6c3604
>> --- /dev/null
>> +++ b/drivers/soc/qcom/eud.c
>> @@ -0,0 +1,329 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) 2016-2018, The Linux Foundation. All rights reserved.
>> + */
>> +
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/slab.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/err.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/extcon.h>
>> +#include <linux/extcon-provider.h>
>> +#include <linux/delay.h>
>> +#include <linux/sysfs.h>
>> +#include <linux/io.h>
>> +#include <linux/bitops.h>
>> +#include <linux/workqueue.h>
>> +#include <linux/power_supply.h>
> Please sort these.
OK
>
>> +
>> +#define EUD_ENABLE_CMD 1
>> +#define EUD_DISABLE_CMD 0
> These defines doesn't add much value.
Will remove them.
>
>> +
>> +#define EUD_REG_INT1_EN_MASK	0x0024
>> +#define EUD_REG_INT_STATUS_1	0x0044
>> +#define EUD_REG_CTL_OUT_1	0x0074
>> +#define EUD_REG_VBUS_INT_CLR	0x0080
>> +#define EUD_REG_CHGR_INT_CLR	0x0084
>> +#define EUD_REG_CSR_EUD_EN	0x1014
>> +#define EUD_REG_SW_ATTACH_DET	0x1018
>> +
>> +#define EUD_INT_VBUS		BIT(2)
>> +#define EUD_INT_CHGR		BIT(3)
>> +#define EUD_INT_SAFE_MODE	BIT(4)
>> +#define EUD_INT_ALL		(EUD_INT_VBUS|EUD_INT_CHGR|\
>> +				EUD_INT_SAFE_MODE)
>> +
>> +struct eud_chip {
>> +	struct device			*dev;
>> +	int				eud_irq;
>> +	unsigned int			extcon_id;
>> +	unsigned int			int_status;
>> +	bool				usb_attach;
>> +	bool				chgr_enable;
>> +	void __iomem			*eud_reg_base;
>> +	struct extcon_dev		*extcon;
>> +	int				enable;
>> +	struct work_struct		eud_work;
>> +};
>> +
>> +static const unsigned int eud_extcon_cable[] = {
>> +	EXTCON_USB,
>> +	EXTCON_CHG_USB_SDP,
>> +	EXTCON_NONE,
>> +};
>> +
>> +static int enable_eud(struct eud_chip *priv)
>> +{
>> +	int ret;
>> +
>> +	/* write into CSR to enable EUD */
> Make up a define for BIT(0) and the next line is self explanatory - i.e.
> drop the comment..
OK.
>
>> +	writel_relaxed(BIT(0), priv->eud_reg_base + EUD_REG_CSR_EUD_EN);
> Don't use _relaxed version of writel/readl unless you have a really good
> reason - and if so provide a comment to why this is.
OK, will change to writel.
>
>> +	/* Enable vbus, chgr & safe mode warning interrupts */
> This just repeats exactly what can be read from the next line.
Ok.
>
>> +	writel_relaxed(EUD_INT_VBUS | EUD_INT_CHGR | EUD_INT_SAFE_MODE,
>> +			priv->eud_reg_base + EUD_REG_INT1_EN_MASK);
>> +
>> +	/* Ensure Register Writes Complete */
> wmb() ensures ordering, it deosn't wait for the operation to complete,
> if you need that readl() the register.
Will fix.
>
>> +	wmb();
>> +
>> +	/*
>> +	 * Set the default cable state to usb connect and charger
>> +	 * enable
>> +	 */
>> +	ret = extcon_set_state_sync(priv->extcon, EXTCON_USB, true);
>> +	if (ret)
>> +		return ret;
>> +	ret = extcon_set_state_sync(priv->extcon,
>> +			EXTCON_CHG_USB_SDP, true);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return 0;
>> +}
>> +
>> +static void disable_eud(struct eud_chip *priv)
>> +{
>> +	/* write into CSR to disable EUD */
>> +	writel_relaxed(0, priv->eud_reg_base + EUD_REG_CSR_EUD_EN);
> Use writel() and drop the comment.
OK
>
>> +}
>> +
>> +static ssize_t enable_show(struct device *dev,
>> +				struct device_attribute *attr, char *buf)
>> +{
>> +	struct eud_chip *chip = dev_get_drvdata(dev);
>> +
>> +	return snprintf(buf, sizeof(int), "%d", chip->enable);
> buf is not sizeof(int) big...Just do sprintf()...
OK
>
>> +}
>> +
>> +static ssize_t enable_store(struct device *dev,
>> +				struct device_attribute *attr,
>> +				const char *buf, size_t count)
>> +{
>> +	struct eud_chip *chip = dev_get_drvdata(dev);
>> +	int enable = 0;
> You shouldn't need to initialize this as you're checking the return
> value of sscanf().
OK
>
>> +	int ret = 0;
>> +
>> +	if (sscanf(buf, "%du", &enable) != 1)
>> +		return -EINVAL;
>> +
>> +	if (enable == EUD_ENABLE_CMD)
>> +		ret = enable_eud(chip);
> If ret is !0 you should probably return that, rather than count...
ok
>
>> +	else if (enable == EUD_DISABLE_CMD)
>> +		disable_eud(chip);
>> +	if (!ret)
> ...and then you don't need this check, or initialize ret to 0 above.
ok
>
>> +		chip->enable = enable;
> So if I write 42 to "enable" nothing will change in the hardware, but
> chip->enable will be 42...
will change enable struct member to bool?
>
>> +	return count;
>> +}
>> +
>> +static DEVICE_ATTR_RW(enable);
>> +
>> +static struct attribute *attrs[] = {
>> +	&dev_attr_enable.attr,
>> +	NULL
>> +};
>> +
>> +static struct attribute_group attr_group = {
>> +	.attrs = attrs,
>> +};
>> +
>> +static const struct attribute_group *attr_groups[] = {
>> +	&attr_group,
>> +	NULL
>> +};
>> +
>> +static void eud_event_notifier(struct work_struct *eud_work)
> Why do you need a worker for this? Why not just use a threaded handler
> and execute this directly in that context?
Will consider it.
>
>> +{
>> +	struct eud_chip *chip = container_of(eud_work, struct eud_chip,
>> +					eud_work);
>> +	int ret;
>> +
>> +	if (chip->int_status == EUD_INT_VBUS) {
> And if you just call this function from the handler, you don't need
> chip->int_status to pass parameters between the handler and the worker.
ok
>
>> +		ret = extcon_set_state_sync(chip->extcon, chip->extcon_id,
>> +					chip->usb_attach);
>> +		if (ret)
>> +			return;
>> +	} else if (chip->int_status == EUD_INT_CHGR) {
>> +		ret = extcon_set_state_sync(chip->extcon, chip->extcon_id,
>> +					chip->chgr_enable);
>> +		if (ret)
>> +			return;
>> +	}
>> +}
>> +
>> +static void usb_attach_detach(struct eud_chip *chip)
>> +{
>> +	u32 reg;
>> +
>> +	chip->extcon_id = EXTCON_USB;
>> +	/* read ctl_out_1[4] to find USB attach or detach event */
>> +	reg = readl_relaxed(chip->eud_reg_base + EUD_REG_CTL_OUT_1);
>> +	if (reg & BIT(4))
> Give this bit a define
ok
>
>> +		chip->usb_attach = true;
>> +	else
>> +		chip->usb_attach = false;
>> +
>> +	schedule_work(&chip->eud_work);
>> +
>> +	/* set and clear vbus_int_clr[0] to clear interrupt */
>> +	writel_relaxed(BIT(0), chip->eud_reg_base + EUD_REG_VBUS_INT_CLR);
>> +	/* Ensure Register Writes Complete */
>> +	wmb();
> Use writel() and you probably don't need the wmb() here.
ok
>
>> +	writel_relaxed(0, chip->eud_reg_base + EUD_REG_VBUS_INT_CLR);
>> +}
>> +
>> +static void chgr_enable_disable(struct eud_chip *chip)
>> +{
>> +	u32 reg;
>> +
>> +	chip->extcon_id = EXTCON_CHG_USB_SDP;
>> +	/* read ctl_out_1[6] to find charger enable or disable event */
>> +	reg = readl_relaxed(chip->eud_reg_base + EUD_REG_CTL_OUT_1);
>> +	if (reg & BIT(6))
> Again, this deserves a define
ok
>
>> +		chip->chgr_enable = true;
>> +	else
>> +		chip->chgr_enable = false;
>> +
>> +	schedule_work(&chip->eud_work);
>> +
>> +	/* set and clear chgr_int_clr[0] to clear interrupt */
>> +	writel_relaxed(BIT(0), chip->eud_reg_base + EUD_REG_CHGR_INT_CLR);
>> +	/* Ensure Register Writes Complete */
>> +	wmb();
>> +	writel_relaxed(0, chip->eud_reg_base + EUD_REG_CHGR_INT_CLR);
>> +}
>> +
>> +static void pet_eud(struct eud_chip *chip)
>> +{
>> +	u32 reg;
>> +
>> +	/* read sw_attach_det[0] to find attach/detach event */
>> +	reg = readl_relaxed(chip->eud_reg_base + EUD_REG_SW_ATTACH_DET);
>> +	if (reg & BIT(0)) {
> define
ok
>
>> +		/* Detach & Attach pet for EUD */
> All comments in this driver relates to the very next line, but this
> seems to document the next two writes - i.e. this seems to be a proper
> comment.
ok
>> +		writel_relaxed(0, chip->eud_reg_base + EUD_REG_SW_ATTACH_DET);
>> +		/* Ensure Register Writes Complete */
>> +		wmb();
>> +		/* Delay to make sure detach pet is done before attach pet */
>> +		udelay(100);
> Better read back the value if you want to ensure the length of the delay
> between the two writes.
ok
>
>> +		writel_relaxed(BIT(0), chip->eud_reg_base +
>> +					EUD_REG_SW_ATTACH_DET);
>> +		/* Ensure Register Writes Complete */
>> +		wmb();
>> +	} else {
>> +		/* Attach pet for EUD */
>> +		writel_relaxed(BIT(0), chip->eud_reg_base +
>> +					EUD_REG_SW_ATTACH_DET);
>> +		/* Ensure Register Writes Complete */
>> +		wmb();
> It will complete, if you need to wait for it to have completed read back
> the value.
ok
>
>> +	}
>> +}
>> +
>> +static irqreturn_t handle_eud_irq(int irq, void *data)
>> +{
>> +	struct eud_chip *chip = data;
>> +	u32 reg;
>> +
>> +	/* read status register and find out which interrupt triggered */
>> +	reg = readl_relaxed(chip->eud_reg_base + EUD_REG_INT_STATUS_1);
>> +	switch (reg & EUD_INT_ALL) {
> What is the expected outcome if for some reason more than one of these
> bits are set?
USB attach/detach events and Charger enable/disable events are 
orthogonal and they both should be processed, will evaluate if break 
statement should be removed.
>
>> +	case EUD_INT_VBUS:
>> +		chip->int_status = EUD_INT_VBUS;
>> +		usb_attach_detach(chip);
>> +		break;
>> +	case EUD_INT_CHGR:
>> +		chip->int_status = EUD_INT_CHGR;
>> +		chgr_enable_disable(chip);
>> +		break;
>> +	case EUD_INT_SAFE_MODE:
>> +		pet_eud(chip);
>> +		break;
>> +	default:
>> +		return IRQ_NONE;
>> +	}
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static int msm_eud_probe(struct platform_device *pdev)
>> +{
>> +	struct eud_chip *chip;
>> +	struct resource *res;
>> +	int ret;
>> +
>> +	chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
>> +	if (!chip)
>> +		return -ENOMEM;
>> +
>> +	chip->dev = &pdev->dev;
>> +	platform_set_drvdata(pdev, chip);
>> +
>> +	chip->extcon = devm_extcon_dev_allocate(&pdev->dev, eud_extcon_cable);
> Aren't we moving away from extcon in favor of the usb role switching
> thing?

i could see that usb role switch has been implemented for c type 
connector and that connector is modeled as child of usb controller, but 
EUD is not a true connector, it intercepts PHY signals and reroute it to 
USB controller as per EUD Command issued by debug appliaction

i am not sure if i need to implement EUD DT node as child of usb 
controller, if i do so, as per my understanding EUD driver need to set 
USB controller mode(host or device mode) by calling usb role switch 
API's, please let me know if my understanding is correct?

>
>> +	if (IS_ERR(chip->extcon))
>> +		return PTR_ERR(chip->extcon);
>> +
>> +	ret = devm_extcon_dev_register(&pdev->dev, chip->extcon);
>> +	if (ret)
>> +		return ret;
>> +
>> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +	if (!res)
>> +		return -ENOMEM;
>> +
>> +	chip->eud_reg_base = devm_ioremap_resource(&pdev->dev, res);
> Use devm_platform_ioremap_resource() instead
Ok.
>
>> +	if (IS_ERR(chip->eud_reg_base))
>> +		return PTR_ERR(chip->eud_reg_base);
>> +
>> +	chip->eud_irq = platform_get_irq(pdev, 0);
>> +
>> +	ret = devm_request_irq(&pdev->dev, chip->eud_irq, handle_eud_irq,
>> +				IRQF_TRIGGER_HIGH, NULL, chip);
> Omit the irq trigger information here and let it come from devicetree.
Ok
>
>> +	if (ret)
>> +		return ret;
>> +
>> +	device_init_wakeup(&pdev->dev, true);
>> +	enable_irq_wake(chip->eud_irq);
>> +
>> +	INIT_WORK(&chip->eud_work, eud_event_notifier);
>> +
>> +	if (ret)
> Duplicate of the same check 8 lines up.
Ok
>
>> +		return ret;
>> +
>> +	/* Enable EUD */
>> +	if (chip->enable)
> I'm not seeing where this would have been written during probe.
Will check and modify.
>
>> +		enable_eud(chip);
>> +
>> +	return 0;
>> +}
>> +
>> +static int msm_eud_remove(struct platform_device *pdev)
>> +{
>> +	struct eud_chip *chip = platform_get_drvdata(pdev);
>> +
>> +	if (chip->enable)
>> +		disable_eud(chip);
>> +	device_init_wakeup(&pdev->dev, false);
>> +	disable_irq_wake(chip->eud_irq);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct of_device_id msm_eud_dt_match[] = {
>> +	{.compatible = "qcom,msm-eud"},
> Is this the one and only, past and future, version of the EUD hardware
> block? Or do we need this compatible to be more specific?
EUD h/w  IP is Qualcomm IP, As of now this is only hw IP available, if 
future version of EUD IP comes, we can modify and add support then?
>
> Nit. Please add a space after { and before }
Ok
>
> Regards,
> Bjorn

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
