Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DC2B26C0AE
	for <lists+linux-usb@lfdr.de>; Wed, 16 Sep 2020 11:34:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726438AbgIPJe5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Sep 2020 05:34:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726302AbgIPJeu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Sep 2020 05:34:50 -0400
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com [IPv6:2607:f8b0:4864:20::942])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA164C06174A
        for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2020 02:34:49 -0700 (PDT)
Received: by mail-ua1-x942.google.com with SMTP id q26so61979uaa.12
        for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2020 02:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xchC9TiGYL+Rcdqk9tQH9VmKwR2wEjN6HUhZbHI/cuY=;
        b=CMAOrVlpLJJOLfxRV4Z+pEwQaJD+1o3eGzHdmG516hUsWVyHPzgw1NuWCG9pBSMwkJ
         t2cNM+Ku3ggSo/oWUB5mTycaWL8URGEI246sV3ShWFUW2tdVyJG4mLueT+lKcTIlPrUG
         lq4bu2uUvG5GQPXOMVPsBa1bAShtKDveqwfqkREuE4uWwVRy35tgzf20sdvA+SYdwTkC
         CzAp1Fn9dkLQxRNU0bjYHwOcDDKDwnOkpP7vWd0YHkX/Zqh+wazpg3o/xjm2uQstiBv6
         Ir1bCdaITzeS5sGVfzckjfU47NfDuxdTnWmU8637Eurv9gczRpz5JszI8h5xv1XiKDzP
         1Flw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xchC9TiGYL+Rcdqk9tQH9VmKwR2wEjN6HUhZbHI/cuY=;
        b=kxTEYhMxU8h4blOJ0KvG21+U0xskf2acykhsUXMrQ3twThdjbNiWk1lLtK8meTdNLD
         I1uIzvpg1Ewv1q36UvFQYRKe7IRL0wWNfc2pJKFdVzjh9nbzQH9ZzlLPMHgRqNpvMVVT
         i1hlqFcE6Gub0M85DS+G/M97QnAHSxTvhnqD69KDLIZtgcPfhSNIEXI5pbL7f6/d7/X0
         wAw4VhHz51Z/Q+abXk9l78/90k3VYwaP+4Lnn1ODep2gbYO6SVJxndl0u6bVFpuI8OOJ
         eqkWQtDR/7LC6GDIq/5y3ZAsRiTxlx726uMWjjjA5XftvCnl6MbI8la2WCYdRbZY3wWK
         sgRg==
X-Gm-Message-State: AOAM530AoHLmxg1Cja9LJLAbY6R2KiP9v1WnUIHyMePxHYUFsINjTDMW
        eD/eK+BuEzzTBBTit2C5xGyyW4NBHBDY8nO8fyeRhg==
X-Google-Smtp-Source: ABdhPJzw9QxaVXQa/vFZQNi8I34GSrEDA1UGdIl7j+FofD6KMKeB9nK678y+NERGUs8+lvS/afloOYraYtdUEKVjEHI=
X-Received: by 2002:a9f:366e:: with SMTP id s43mr750881uad.69.1600248887791;
 Wed, 16 Sep 2020 02:34:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200901025927.3596190-1-badhri@google.com> <20200901025927.3596190-8-badhri@google.com>
 <20200915124356.GG1139641@kuha.fi.intel.com>
In-Reply-To: <20200915124356.GG1139641@kuha.fi.intel.com>
From:   Badhri Jagan Sridharan <badhri@google.com>
Date:   Wed, 16 Sep 2020 02:34:10 -0700
Message-ID: <CAPTae5J8YB8VrKhvWrz8pkQ6rY+uqOFntfR2kY0gZYAu0SXvLw@mail.gmail.com>
Subject: Re: [PATCH v6 07/14] usb: typec: tcpci_maxim: Chip level TCPC driver
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 15, 2020 at 5:44 AM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Mon, Aug 31, 2020 at 07:59:20PM -0700, Badhri Jagan Sridharan wrote:
> > Chip level TCPC driver for Maxim's TCPCI implementation.
> > This TCPC implementation does not support the following
> > commands: COMMAND.SinkVbus, COMMAND.SourceVbusDefaultVoltage,
> > COMMAND.SourceVbusHighVoltage. Instead the sinking and sourcing
> > from vbus is supported by writes to custom registers.
> >
> > Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
> > ---
> > Changes since v1:
> > - Changing patch version to v6 to fix version number confusion.
> > - Removed setting USB_PSY and terminating description with period as
> >   suggested by Randy.
> > ---
> >  drivers/usb/typec/tcpm/Kconfig       |   5 +
> >  drivers/usb/typec/tcpm/Makefile      |  13 +-
> >  drivers/usb/typec/tcpm/tcpci.h       |   1 +
> >  drivers/usb/typec/tcpm/tcpci_maxim.c | 474 +++++++++++++++++++++++++++
> >  4 files changed, 487 insertions(+), 6 deletions(-)
> >  create mode 100644 drivers/usb/typec/tcpm/tcpci_maxim.c
> >
> > diff --git a/drivers/usb/typec/tcpm/Kconfig b/drivers/usb/typec/tcpm/Kconfig
> > index fa3f39336246..dd0d446a4613 100644
> > --- a/drivers/usb/typec/tcpm/Kconfig
> > +++ b/drivers/usb/typec/tcpm/Kconfig
> > @@ -27,6 +27,11 @@ config TYPEC_RT1711H
> >         Type-C Port Controller Manager to provide USB PD and USB
> >         Type-C functionalities.
> >
> > +config TYPEC_TCPCI_MAXIM
> > +     tristate "Maxim TCPCI based Type-C chip driver"
> > +     help
> > +       MAXIM TCPCI based Type-C chip driver.
> > +
> >  endif # TYPEC_TCPCI
> >
> >  config TYPEC_FUSB302
> > diff --git a/drivers/usb/typec/tcpm/Makefile b/drivers/usb/typec/tcpm/Makefile
> > index a5ff6c8eb892..58d001cf0dd2 100644
> > --- a/drivers/usb/typec/tcpm/Makefile
> > +++ b/drivers/usb/typec/tcpm/Makefile
> > @@ -1,7 +1,8 @@
> >  # SPDX-License-Identifier: GPL-2.0
> > -obj-$(CONFIG_TYPEC_TCPM)     += tcpm.o
> > -obj-$(CONFIG_TYPEC_FUSB302)  += fusb302.o
> > -obj-$(CONFIG_TYPEC_WCOVE)    += typec_wcove.o
> > -typec_wcove-y                        := wcove.o
> > -obj-$(CONFIG_TYPEC_TCPCI)    += tcpci.o
> > -obj-$(CONFIG_TYPEC_RT1711H)  += tcpci_rt1711h.o
> > +obj-$(CONFIG_TYPEC_TCPM)             += tcpm.o
> > +obj-$(CONFIG_TYPEC_FUSB302)          += fusb302.o
> > +obj-$(CONFIG_TYPEC_WCOVE)            += typec_wcove.o
> > +typec_wcove-y                                := wcove.o
> > +obj-$(CONFIG_TYPEC_TCPCI)            += tcpci.o
> > +obj-$(CONFIG_TYPEC_RT1711H)          += tcpci_rt1711h.o
> > +obj-$(CONFIG_TYPEC_TCPCI_MAXIM)              += tcpci_maxim.o
> > diff --git a/drivers/usb/typec/tcpm/tcpci.h b/drivers/usb/typec/tcpm/tcpci.h
> > index 4d441bdf24d5..82f021a82456 100644
> > --- a/drivers/usb/typec/tcpm/tcpci.h
> > +++ b/drivers/usb/typec/tcpm/tcpci.h
> > @@ -109,6 +109,7 @@
> >
> >  #define TCPC_RX_BYTE_CNT             0x30
> >  #define TCPC_RX_BUF_FRAME_TYPE               0x31
> > +#define TCPC_RX_BUF_FRAME_TYPE_SOP   0
> >  #define TCPC_RX_HDR                  0x32
> >  #define TCPC_RX_DATA                 0x34 /* through 0x4f */
> >
> > diff --git a/drivers/usb/typec/tcpm/tcpci_maxim.c b/drivers/usb/typec/tcpm/tcpci_maxim.c
> > new file mode 100644
> > index 000000000000..b61f290a8f96
> > --- /dev/null
> > +++ b/drivers/usb/typec/tcpm/tcpci_maxim.c
> > @@ -0,0 +1,474 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2020, Google LLC
> > + *
> > + * MAXIM TCPCI based TCPC driver
> > + */
> > +
> > +#include <linux/gpio.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/i2c.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/of_gpio.h>
> > +#include <linux/regmap.h>
> > +#include <linux/usb/pd.h>
> > +#include <linux/usb/tcpm.h>
> > +#include <linux/usb/typec.h>
> > +
> > +#include "tcpci.h"
> > +
> > +#define PD_ACTIVITY_TIMEOUT_MS                               10000
> > +
> > +#define TCPC_VENDOR_ALERT                            0x80
> > +
> > +#define TCPC_RECEIVE_BUFFER_COUNT_OFFSET             0
> > +#define TCPC_RECEIVE_BUFFER_FRAME_TYPE_OFFSET                1
> > +#define TCPC_RECEIVE_BUFFER_RX_BYTE_BUF_OFFSET               2
> > +
> > +/*
> > + * LongMessage not supported, hence 32 bytes for buf to be read from RECEIVE_BUFFER.
> > + * DEVICE_CAPABILITIES_2.LongMessage = 0, the value in READABLE_BYTE_COUNT reg shall be
> > + * less than or equal to 31. Since, RECEIVE_BUFFER len = 31 + 1(READABLE_BYTE_COUNT).
> > + */
> > +#define TCPC_RECEIVE_BUFFER_LEN                              32
> > +
> > +#define MAX_BUCK_BOOST_SID                           0x69
> > +#define MAX_BUCK_BOOST_OP                            0xb9
> > +#define MAX_BUCK_BOOST_OFF                           0
> > +#define MAX_BUCK_BOOST_SOURCE                                0xa
> > +#define MAX_BUCK_BOOST_SINK                          0x5
> > +
> > +struct max_tcpci_chip {
> > +     struct tcpci_data data;
> > +     struct tcpci *tcpci;
> > +     struct device *dev;
> > +     struct i2c_client *client;
> > +     struct tcpm_port *port;
> > +};
> > +
> > +static const struct regmap_range max_tcpci_tcpci_range[] = {
> > +     regmap_reg_range(0x00, 0x95)
> > +};
> > +
> > +const struct regmap_access_table max_tcpci_tcpci_write_table = {
> > +     .yes_ranges = max_tcpci_tcpci_range,
> > +     .n_yes_ranges = ARRAY_SIZE(max_tcpci_tcpci_range),
> > +};
> > +
> > +static const struct regmap_config max_tcpci_regmap_config = {
> > +     .reg_bits = 8,
> > +     .val_bits = 8,
> > +     .max_register = 0x95,
> > +     .wr_table = &max_tcpci_tcpci_write_table,
> > +};
> > +
> > +static struct max_tcpci_chip *tdata_to_max_tcpci(struct tcpci_data *tdata)
> > +{
> > +     return container_of(tdata, struct max_tcpci_chip, data);
> > +}
> > +
> > +static int max_tcpci_read16(struct max_tcpci_chip *chip, unsigned int reg, u16 *val)
> > +{
> > +     return regmap_raw_read(chip->data.regmap, reg, val, sizeof(u16));
> > +}
> > +
> > +static int max_tcpci_write16(struct max_tcpci_chip *chip, unsigned int reg, u16 val)
> > +{
> > +     return regmap_raw_write(chip->data.regmap, reg, &val, sizeof(u16));
> > +}
> > +
> > +static int max_tcpci_read8(struct max_tcpci_chip *chip, unsigned int reg, u8 *val)
> > +{
> > +     return regmap_raw_read(chip->data.regmap, reg, val, sizeof(u8));
> > +}
> > +
> > +static int max_tcpci_write8(struct max_tcpci_chip *chip, unsigned int reg, u8 val)
> > +{
> > +     return regmap_raw_write(chip->data.regmap, reg, &val, sizeof(u8));
> > +}
> > +
> > +static void max_tcpci_init_regs(struct max_tcpci_chip *chip)
> > +{
> > +     u16 alert_mask = 0;
> > +     int ret;
> > +
> > +     ret = max_tcpci_write16(chip, TCPC_ALERT, 0xffff);
> > +     if (ret < 0) {
> > +             dev_err(chip->dev, "Error writing to TCPC_ALERT ret:%d\n", ret);
> > +             return;
> > +     }
> > +
> > +     ret = max_tcpci_write16(chip, TCPC_VENDOR_ALERT, 0xffff);
> > +     if (ret < 0) {
> > +             dev_err(chip->dev, "Error writing to TCPC_VENDOR_ALERT ret:%d\n", ret);
> > +             return;
> > +     }
> > +
> > +     alert_mask = TCPC_ALERT_TX_SUCCESS | TCPC_ALERT_TX_DISCARDED | TCPC_ALERT_TX_FAILED |
> > +             TCPC_ALERT_RX_HARD_RST | TCPC_ALERT_RX_STATUS | TCPC_ALERT_CC_STATUS |
> > +             TCPC_ALERT_VBUS_DISCNCT | TCPC_ALERT_RX_BUF_OVF | TCPC_ALERT_POWER_STATUS;
> > +
> > +     ret = max_tcpci_write16(chip, TCPC_ALERT_MASK, alert_mask);
> > +     if (ret < 0) {
> > +             dev_err(chip->dev, "Error writing to TCPC_ALERT_MASK ret:%d\n", ret);
> > +             return;
> > +     }
> > +
> > +     /* Enable vbus voltage monitoring and voltage alerts */
> > +     ret = max_tcpci_write8(chip, TCPC_POWER_CTRL, 0);
> > +     if (ret < 0) {
> > +             dev_err(chip->dev, "Error writing to TCPC_POWER_CTRL ret:%d\n", ret);
> > +             return;
> > +     }
> > +}
> > +
> > +static void process_rx(struct max_tcpci_chip *chip, u16 status)
> > +{
> > +     struct pd_message msg;
> > +     u8 count, frame_type, rx_buf[TCPC_RECEIVE_BUFFER_LEN];
> > +     int ret, payload_index;
> > +     u8 *rx_buf_ptr;
> > +
> > +     /*
> > +      * READABLE_BYTE_COUNT: Indicates the number of bytes in the RX_BUF_BYTE_x registers
> > +      * plus one (for the RX_BUF_FRAME_TYPE) Table 4-36.
> > +      * Read the count and frame type.
> > +      */
> > +     ret = regmap_raw_read(chip->data.regmap, TCPC_RX_BYTE_CNT, rx_buf, 2);
> > +     if (ret < 0) {
> > +             dev_err(chip->dev, "TCPC_RX_BYTE_CNT read failed ret:%d", ret);
> > +             return;
> > +     }
> > +
> > +     count = rx_buf[TCPC_RECEIVE_BUFFER_COUNT_OFFSET];
> > +     frame_type = rx_buf[TCPC_RECEIVE_BUFFER_FRAME_TYPE_OFFSET];
> > +
> > +     if (count == 0 || frame_type != TCPC_RX_BUF_FRAME_TYPE_SOP) {
> > +             max_tcpci_write16(chip, TCPC_ALERT, TCPC_ALERT_RX_STATUS);
> > +             dev_err(chip->dev, "%s", count ==  0 ? "error: count is 0" :
> > +                     "error frame_type is not SOP");
> > +             return;
> > +     }
> > +
> > +     if (count > sizeof(struct pd_message) || count + 1 > TCPC_RECEIVE_BUFFER_LEN) {
> > +             dev_err(chip->dev, "Invalid TCPC_RX_BYTE_CNT %d", count);
> > +             return;
> > +     }
> > +
> > +     /*
> > +      * Read count + 1 as RX_BUF_BYTE_x is hidden and can only be read through
> > +      * TCPC_RX_BYTE_CNT
> > +      */
> > +     count += 1;
> > +     ret = regmap_raw_read(chip->data.regmap, TCPC_RX_BYTE_CNT, rx_buf, count);
> > +     if (ret < 0) {
> > +             dev_err(chip->dev, "Error: TCPC_RX_BYTE_CNT read failed: %d", ret);
> > +             return;
> > +     }
> > +
> > +     rx_buf_ptr = rx_buf + TCPC_RECEIVE_BUFFER_RX_BYTE_BUF_OFFSET;
> > +     msg.header = cpu_to_le16(*(u16 *)rx_buf_ptr);
> > +     rx_buf_ptr = rx_buf_ptr + sizeof(msg.header);
> > +     for (payload_index = 0; payload_index < pd_header_cnt_le(msg.header); payload_index++,
> > +          rx_buf_ptr += sizeof(msg.payload[0]))
> > +             msg.payload[payload_index] = cpu_to_le32(*(u32 *)rx_buf_ptr);
> > +
> > +     /*
> > +      * Read complete, clear RX status alert bit.
> > +      * Clear overflow as well if set.
> > +      */
> > +     ret = max_tcpci_write16(chip, TCPC_ALERT, status & TCPC_ALERT_RX_BUF_OVF ?
> > +                             TCPC_ALERT_RX_STATUS | TCPC_ALERT_RX_BUF_OVF :
> > +                             TCPC_ALERT_RX_STATUS);
> > +     if (ret < 0)
> > +             return;
> > +
> > +     tcpm_pd_receive(chip->port, &msg);
> > +}
> > +
> > +static int max_tcpci_set_vbus(struct tcpci *tcpci, struct tcpci_data *tdata, bool source, bool sink)
> > +{
> > +     struct max_tcpci_chip *chip = tdata_to_max_tcpci(tdata);
> > +     u8 buffer_source[2] = {MAX_BUCK_BOOST_OP, MAX_BUCK_BOOST_SOURCE};
> > +     u8 buffer_sink[2] = {MAX_BUCK_BOOST_OP, MAX_BUCK_BOOST_SINK};
> > +     u8 buffer_none[2] = {MAX_BUCK_BOOST_OP, MAX_BUCK_BOOST_OFF};
> > +     struct i2c_client *i2c = chip->client;
> > +     int ret;
> > +
> > +     struct i2c_msg msgs[] = {
> > +             {
> > +                     .addr = MAX_BUCK_BOOST_SID,
> > +                     .flags = i2c->flags & I2C_M_TEN,
> > +                     .len = 2,
> > +                     .buf = source ? buffer_source : sink ? buffer_sink : buffer_none,
> > +             },
> > +     };
> > +
> > +     if (source && sink) {
> > +             dev_err(chip->dev, "Both source and sink set\n");
> > +             return -EINVAL;
> > +     }
>
> So can buffer_none ever be used?

Yes. When TCPM makes the call here
https://elixir.bootlin.com/linux/latest/source/drivers/usb/typec/tcpm/tcpm.c#L2602.
@ tcpm_init_vbus which is called in the source/sink disconnect path.
Does that address your question ?


>
> > +     ret = i2c_transfer(i2c->adapter, msgs, 1);
> > +
> > +     return  ret < 0 ? ret : 1;
> > +}
> > +
> > +static void process_power_status(struct max_tcpci_chip *chip)
> > +{
> > +     u8 pwr_status;
> > +     int ret;
> > +
> > +     ret = max_tcpci_read8(chip, TCPC_POWER_STATUS, &pwr_status);
> > +     if (ret < 0)
> > +             return;
> > +
> > +     if (pwr_status == 0xff)
> > +             max_tcpci_init_regs(chip);
> > +     else
> > +             tcpm_vbus_change(chip->port);
> > +}
> > +
> > +static void process_tx(struct max_tcpci_chip *chip, u16 status)
> > +{
> > +     if (status & TCPC_ALERT_TX_SUCCESS)
> > +             tcpm_pd_transmit_complete(chip->port, TCPC_TX_SUCCESS);
> > +     else if (status & TCPC_ALERT_TX_DISCARDED)
> > +             tcpm_pd_transmit_complete(chip->port, TCPC_TX_DISCARDED);
> > +     else if (status & TCPC_ALERT_TX_FAILED)
> > +             tcpm_pd_transmit_complete(chip->port, TCPC_TX_FAILED);
> > +
> > +     /* Reinit regs as Hard reset sets them to default value */
> > +     if ((status & TCPC_ALERT_TX_SUCCESS) && (status & TCPC_ALERT_TX_FAILED))
> > +             max_tcpci_init_regs(chip);
> > +}
> > +
> > +static irqreturn_t _max_tcpci_irq(struct max_tcpci_chip *chip, u16 status)
> > +{
> > +     u16 mask;
> > +     int ret;
> > +
> > +     /*
> > +      * Clear alert status for everything except RX_STATUS, which shouldn't
> > +      * be cleared until we have successfully retrieved message.
> > +      */
> > +     if (status & ~TCPC_ALERT_RX_STATUS) {
> > +             mask = status & TCPC_ALERT_RX_BUF_OVF ?
> > +                     status & ~(TCPC_ALERT_RX_STATUS | TCPC_ALERT_RX_BUF_OVF) :
> > +                     status & ~TCPC_ALERT_RX_STATUS;
> > +             ret = max_tcpci_write16(chip, TCPC_ALERT, mask);
> > +             if (ret < 0) {
> > +                     dev_err(chip->dev, "ALERT clear failed\n");
> > +                     return ret;
> > +             }
> > +     }
> > +
> > +     if (status & TCPC_ALERT_RX_BUF_OVF && !(status & TCPC_ALERT_RX_STATUS)) {
> > +             ret = max_tcpci_write16(chip, TCPC_ALERT, (TCPC_ALERT_RX_STATUS |
> > +                                                       TCPC_ALERT_RX_BUF_OVF));
> > +             if (ret < 0) {
> > +                     dev_err(chip->dev, "ALERT clear failed\n");
> > +                     return ret;
> > +             }
> > +     }
> > +
> > +     if (status & TCPC_ALERT_RX_STATUS)
> > +             process_rx(chip, status);
> > +
> > +     if (status & TCPC_ALERT_TX_DISCARDED)
> > +             dev_info(chip->dev, "TX_DISCARDED");
>
> What does that mean? Is it relevant for the user?
This indicates that most recent transmission of the pd packet is not successful.
I believe TCPM also prints this info in the TCPM debugfs logs
(status=2 if I remember right).
I will remove the log since it's redundant.

>
> > +
> > +     if (status & TCPC_ALERT_VBUS_DISCNCT)
> > +             tcpm_vbus_change(chip->port);
> > +
> > +     if (status & TCPC_ALERT_CC_STATUS)
> > +             tcpm_cc_change(chip->port);
> > +
> > +     if (status & TCPC_ALERT_POWER_STATUS)
> > +             process_power_status(chip);
> > +
> > +     if (status & TCPC_ALERT_RX_HARD_RST) {
> > +             tcpm_pd_hard_reset(chip->port);
> > +             max_tcpci_init_regs(chip);
> > +     }
> > +
> > +     if (status & TCPC_ALERT_TX_SUCCESS || status & TCPC_ALERT_TX_DISCARDED || status &
> > +         TCPC_ALERT_TX_FAILED)
> > +             process_tx(chip, status);
> > +
> > +     return IRQ_HANDLED;
> > +}
> > +
> > +static irqreturn_t max_tcpci_irq(int irq, void *dev_id)
> > +{
> > +     struct max_tcpci_chip *chip = dev_id;
> > +     u16 status;
> > +     irqreturn_t irq_return;
> > +     int ret;
> > +
> > +     if (!chip->port)
> > +             return IRQ_HANDLED;
> > +
> > +     ret = max_tcpci_read16(chip, TCPC_ALERT, &status);
> > +     if (ret < 0) {
> > +             dev_err(chip->dev, "ALERT read failed\n");
> > +             return ret;
> > +     }
> > +     while (status) {
> > +             irq_return = _max_tcpci_irq(chip, status);
> > +             /* Do not return if the ALERT is already set. */
> > +             ret = max_tcpci_read16(chip, TCPC_ALERT, &status);
> > +             if (ret < 0)
> > +                     break;
> > +     }
> > +
> > +     return irq_return;
> > +}
> > +
> > +static irqreturn_t max_tcpci_isr(int irq, void *dev_id)
> > +{
> > +     struct max_tcpci_chip *chip = dev_id;
> > +
> > +     pm_wakeup_event(chip->dev, PD_ACTIVITY_TIMEOUT_MS);
> > +
> > +     if (!chip->port)
> > +             return IRQ_HANDLED;
> > +
> > +     return IRQ_WAKE_THREAD;
> > +}
> > +
> > +static int max_tcpci_init_alert(struct max_tcpci_chip *chip, struct i2c_client *client)
> > +{
> > +     int ret, irq_gpio;
> > +
> > +     irq_gpio = of_get_named_gpio(client->dev.of_node, "usbpd,usbpd_int", 0);
> > +     client->irq = gpio_to_irq(irq_gpio);
> > +     if (!client->irq)
> > +             return -ENODEV;
> > +
> > +     ret = devm_request_threaded_irq(chip->dev, client->irq, max_tcpci_isr, max_tcpci_irq,
> > +                                     (IRQF_TRIGGER_LOW | IRQF_ONESHOT), dev_name(chip->dev),
> > +                                     chip);
> > +
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     enable_irq_wake(client->irq);
> > +     return 0;
> > +}
> > +
> > +static int max_tcpci_start_toggling(struct tcpci *tcpci, struct tcpci_data *tdata,
> > +                                 enum typec_cc_status cc)
> > +{
> > +     struct max_tcpci_chip *chip = tdata_to_max_tcpci(tdata);
> > +
> > +     max_tcpci_init_regs(chip);
> > +
> > +     return 0;
> > +}
> > +
> > +static int tcpci_init(struct tcpci *tcpci, struct tcpci_data *data)
> > +{
> > +     /*
> > +      * Generic TCPCI overwrites the regs once this driver initializes
> > +      * them. Prevent this by returning -1.
> > +      */
> > +     return -1;
> > +}
> > +
> > +static int max_tcpci_probe(struct i2c_client *client, const struct i2c_device_id *i2c_id)
> > +{
> > +     int ret;
> > +     struct max_tcpci_chip *chip;
> > +     u8 power_status;
> > +
> > +     chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
> > +     if (!chip)
> > +             return -ENOMEM;
> > +
> > +     chip->client = client;
> > +     chip->data.regmap = devm_regmap_init_i2c(client, &max_tcpci_regmap_config);
> > +     if (IS_ERR(chip->data.regmap)) {
> > +             dev_err(&client->dev, "Regmap init failed\n");
> > +             return PTR_ERR(chip->data.regmap);
> > +     }
> > +
> > +     chip->dev = &client->dev;
> > +     i2c_set_clientdata(client, chip);
> > +
> > +     ret = max_tcpci_read8(chip, TCPC_POWER_STATUS, &power_status);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     if (power_status & TCPC_POWER_STATUS_UNINIT) {
> > +             dev_err(&client->dev, "TCPC not ready!");
> > +             return -EPROBE_DEFER;
> > +     }
>
> That looks wrong. There is no guarantee that this wasn't the last
> device that is registered for a while. Or is there?
>
> I think you should consider TCPC_POWER_STATUS_UNINIT in tcpci_init(),
> just like tcpci.c does. Or is there some reason why you are checking
> it here?

There is no additional reason. I missed that tcpci_iinit code is also
checking for this.
Also, misunderstood that the bit is cleared only once after power on as I read
"1b: The TCPC is still performing internal initialization and the only registers
that are guaranteed to return the correct values are 00h...0Fh" but missed
"The TCPM shall check the state of the TCPC Initialization Status bit
when it starts or **resets.**"
which is mentioned above the register description.

Will Remove.

> > +
> > +     /* Chip level tcpci callbacks */
> > +     chip->data.set_vbus = max_tcpci_set_vbus;
> > +     chip->data.start_drp_toggling = max_tcpci_start_toggling;
> > +     chip->data.TX_BUF_BYTE_x_hidden = true;
> > +     chip->data.init = tcpci_init;
> > +
> > +     max_tcpci_init_regs(chip);
> > +     chip->tcpci = tcpci_register_port(chip->dev, &chip->data);
> > +     if (IS_ERR_OR_NULL(chip->tcpci)) {
> > +             dev_err(&client->dev, "TCPCI port registration failed");
> > +             ret = PTR_ERR(chip->tcpci);
> > +             return PTR_ERR(chip->tcpci);
> > +     }
> > +     chip->port = tcpci_get_tcpm_port(chip->tcpci);
> > +     ret = max_tcpci_init_alert(chip, client);
> > +     if (ret < 0)
> > +             goto unreg_port;
> > +
> > +     device_init_wakeup(chip->dev, true);
> > +     return 0;
> > +
> > +unreg_port:
> > +     tcpci_unregister_port(chip->tcpci);
> > +
> > +     return ret;
> > +}
> > +
> > +static int max_tcpci_remove(struct i2c_client *client)
> > +{
> > +     struct max_tcpci_chip *chip = i2c_get_clientdata(client);
> > +
> > +     if (!IS_ERR_OR_NULL(chip->tcpci))
> > +             tcpci_unregister_port(chip->tcpci);
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct i2c_device_id max_tcpci_id[] = {
> > +     { "maxtcpc", 0 },
> > +     { }
> > +};
> > +MODULE_DEVICE_TABLE(i2c, max_tcpci_id);
> > +
> > +#ifdef CONFIG_OF
> > +static const struct of_device_id max_tcpci_of_match[] = {
> > +     { .compatible = "maxim,tcpc", },
> > +     {},
> > +};
> > +MODULE_DEVICE_TABLE(of, max_tcpci_of_match);
> > +#endif
> > +
> > +static struct i2c_driver max_tcpci_i2c_driver = {
> > +     .driver = {
> > +             .name = "maxtcpc",
> > +             .of_match_table = of_match_ptr(max_tcpci_of_match),
> > +     },
> > +     .probe = max_tcpci_probe,
> > +     .remove = max_tcpci_remove,
> > +     .id_table = max_tcpci_id,
> > +};
> > +module_i2c_driver(max_tcpci_i2c_driver);
> > +
> > +MODULE_AUTHOR("Badhri Jagan Sridharan <badhri@google.com>");
> > +MODULE_DESCRIPTION("Maxim TCPCI based USB Type-C Port Controller Interface Driver");
> > +MODULE_LICENSE("GPL v2");
> > --
> > 2.28.0.402.g5ffc5be6b7-goog
>
> thanks,
>
> --
> heikki
