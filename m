Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01D133AC952
	for <lists+linux-usb@lfdr.de>; Fri, 18 Jun 2021 13:04:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233146AbhFRLG0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Jun 2021 07:06:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229550AbhFRLG0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Jun 2021 07:06:26 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6CB9C061574;
        Fri, 18 Jun 2021 04:04:15 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id nd37so15300054ejc.3;
        Fri, 18 Jun 2021 04:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Pzbe7SUFsVb3K+6/BzcNIyP+oKhm2UYEHpRDym3qkRM=;
        b=EFTxhJ9+g7DCsECExjfGclqzCmMvI6s1h+xZ6lrUosLRZ7uFmt86p6CHFWGRcHwOzC
         kbR+7OeCPFaDeVHPq4W0iHl1WxTOOExG+5IR/TBcWzmJNI45EW5KmSIfZ2ea2V0GQZ2H
         jIAV/QYx6gn6W04mXkuLlnCQ30ANT4psMvw0ivhNcONEMoVnfRgJbtml8HQce1neX2rr
         17u7HyvHjRiJv0m1y2kzF8u6qTgoJpJZVWYTNf7Q/bVB7wGOuWA1LOj54TgQwBQ41Veg
         QP/tiPKFQpcKquvHWHCQxGRjW5a0u5kQ8KPeko6SK1RC9lsaL2ufV3IkdvMlIMwfWCzH
         sJ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Pzbe7SUFsVb3K+6/BzcNIyP+oKhm2UYEHpRDym3qkRM=;
        b=Pu9vvqCKKS4VD6gojjRlYuajNc6n2E4wyKZr1JbkfpA0cKOqJStb6XF2plCoz35A3+
         C8CB066qC9IqXdK64qujB44Y6IwcC9IbYvnbc6raTxunvMuPYrEHmrW3lWVVoTzcecif
         aDvOLDNfKnTCQKK9OHAnQJoLgGd0RqeV1Q1Le7/WruFP5DfvWGc7Jj8Lbgo/e41XoYJn
         VgsfK5ox+HT3iaxsNEmLz9qrWSuI/2JZUyt5BjfdtHhNY9TYpJ5uhrUs2J3qkhlPbmHu
         ZG22vtfe+9M5b1e8+9hEcDSJWvO/mQ/BeWPSzpIqqUdbL93sRKgsgsauEv0bsOMAzYX6
         KQHg==
X-Gm-Message-State: AOAM5338k5fT204rp59mMEj60uM9jwhQsLRID3Oy9oSOCuPfJKlLnREU
        650Eyqc0Ak5SFQI62ga9M8YLj/JwXcc=
X-Google-Smtp-Source: ABdhPJwoYE/PnNd163YyiUOpNorpXgPZhxHotClJbb0wWcotQ692SKNjwERWxcaE51uG2eLXi7Jo8Q==
X-Received: by 2002:a17:906:3181:: with SMTP id 1mr10569159ejy.36.1624014253654;
        Fri, 18 Jun 2021 04:04:13 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f29:3800:1d27:de0:cd0a:55c0? (p200300ea8f2938001d270de0cd0a55c0.dip0.t-ipconnect.de. [2003:ea:8f29:3800:1d27:de0:cd0a:55c0])
        by smtp.googlemail.com with ESMTPSA id x13sm902413ejj.21.2021.06.18.04.04.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jun 2021 04:04:13 -0700 (PDT)
Subject: Re: [PATCH net-next v2 4/8] net: usb: asix: ax88772: add phylib
 support
To:     Oleksij Rempel <o.rempel@pengutronix.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Russell King <linux@armlinux.org.uk>, kernel@pengutronix.de,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        netdev@vger.kernel.org
References: <20210607082727.26045-1-o.rempel@pengutronix.de>
 <20210607082727.26045-5-o.rempel@pengutronix.de>
 <CGME20210618083914eucas1p240f88e7064a7bf15b68370b7506d24a9@eucas1p2.samsung.com>
 <15e1bb24-7d67-9d45-54c1-c1c1a0fe444a@samsung.com>
 <20210618101317.55fr5vl5akmtgcf6@pengutronix.de>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <b1c48fa1-d406-766e-f8d7-54f76d3acb7c@gmail.com>
Date:   Fri, 18 Jun 2021 13:04:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210618101317.55fr5vl5akmtgcf6@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 18.06.2021 12:13, Oleksij Rempel wrote:
> Hi Marek,
> 
> thank you for your feedback.
> 
> On Fri, Jun 18, 2021 at 10:39:12AM +0200, Marek Szyprowski wrote:
>> Hi Oleksij,
>>
>> On 07.06.2021 10:27, Oleksij Rempel wrote:
>>> To be able to use ax88772 with external PHYs and use advantage of
>>> existing PHY drivers, we need to port at least ax88772 part of asix
>>> driver to the phylib framework.
>>>
>>> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
>>
>> I found one more issue with this patch. On one of my test boards 
>> (Samsung Exynos5250 SoC based Arndale) system fails to establish network 
>> connection just after starting the kernel when the driver is build-in.
>>
If you build in the MAC driver, do you also build in the PHY driver?
If the PHY driver is still a module this could explain why genphy
driver is used.
And your dmesg filtering suppresses the phy_attached_info() output
that would tell us the truth.

>> --->8---
>> # dmesg | grep asix
>> [    2.761928] usbcore: registered new interface driver asix
>> [    5.003110] asix 1-3.2.4:1.0 (unnamed net_device) (uninitialized): 
>> invalid hw address, using random
>> [    6.065400] asix 1-3.2.4:1.0 eth0: register 'asix' at 
>> usb-12110000.usb-3.2.4, ASIX AX88772 USB 2.0 Ethernet, 7a:9b:9a:f2:94:8e
>> [   14.043868] asix 1-3.2.4:1.0 eth0: Link is Up - 100Mbps/Full - flow 
>> control off
>> # ping -c2  host
>> PING host (192.168.100.1) 56(84) bytes of data.
>>  From 192.168.100.20 icmp_seq=1 Destination Host Unreachable
>>  From 192.168.100.20 icmp_seq=2 Destination Host Unreachable
>>
>> --- host ping statistics ---
>> 2 packets transmitted, 0 received, +2 errors, 100% packet loss, time 59ms
>> --->8---
> 
> Hm... it looks like different chip variant. My is registered as
> "ASIX AX88772B USB", yours is "ASIX AX88772 USB 2.0" - "B" is the
> difference. Can you please tell me more about this adapter and if possible open
> tell the real part name.
> 
> I can imagine that this adapter may using generic PHY driver.
> Can you please confirm it by dmesg | grep PHY?
> In my case i'll get:
> Asix Electronics AX88772C usb-001:003:10: attached PHY driver (mii_bus:phy_addr=usb-001:003:10, irq=POLL)
> 
> If you have a different PHY, can you please send me the PHY id:
> cat /sys/bus/mdio_bus/devices/usb-001\:003\:10/phy_id
> 
> Your usb path will probably be different.
> 
>> Calling ifup eth0 && ifdown eth0 fixes the network status:
>>
>> --->8---
>> # ifdown eth0 && ifup eth0
>> [   60.474929] asix 1-3.2.4:1.0 eth0: Link is Down
>> [   60.623516] asix 1-3.2.4:1.0 eth0: Link is Down
>> [   62.774304] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
>> [   62.786354] asix 1-3.2.4:1.0 eth0: Link is Up - 100Mbps/Full - flow 
>> control off
>> # ping -c2 host
>> PING host (192.168.100.1) 56(84) bytes of data.
>> 64 bytes from host (192.168.100.1): icmp_seq=1 ttl=64 time=1.25 ms
>> 64 bytes from host (192.168.100.1): icmp_seq=2 ttl=64 time=0.853 ms
>>
>> --- host ping statistics ---
>> 2 packets transmitted, 2 received, 0% packet loss, time 3ms
>> rtt min/avg/max/mdev = 0.853/1.053/1.254/0.203 ms
>> --->8---
>>
>> When driver is loaded as a module (and without any other modules, so 
>> this is not a dependency issue), the connection is established properly 
>> just after the boot:
>>
>> --->8---
>> # dmesg | grep asix
>> [   13.633284] asix 1-3.2.4:1.0 (unnamed net_device) (uninitialized): 
>> invalid hw address, using random
>> [   15.390350] asix 1-3.2.4:1.0 eth0: register 'asix' at 
>> usb-12110000.usb-3.2.4, ASIX AX88772 USB 2.0 Ethernet, 3a:51:11:08:aa:ea
>> [   15.414052] usbcore: registered new interface driver asix
>> [   15.832564] asix 1-3.2.4:1.0 eth0: Link is Down
>> [   18.053747] asix 1-3.2.4:1.0 eth0: Link is Up - 100Mbps/Full - flow 
>> control off
>> # ping -c2 host
>> PING host (192.168.100.1) 56(84) bytes of data.
>> 64 bytes from host (192.168.100.1): icmp_seq=1 ttl=64 time=0.545 ms
>> 64 bytes from host (192.168.100.1): icmp_seq=2 ttl=64 time=0.742 ms
>>
>> --- host ping statistics ---
>> 2 packets transmitted, 2 received, 0% packet loss, time 3ms
>> rtt min/avg/max/mdev = 0.545/0.643/0.742/0.101 ms
>>
>> --->8---
>>
>> Let me know if I can make any other tests that would help fixing this issue.
>>
>>> ---
>>>   drivers/net/usb/asix.h         |   9 +++
>>>   drivers/net/usb/asix_common.c  |  37 ++++++++++
>>>   drivers/net/usb/asix_devices.c | 120 +++++++++++++++++++++------------
>>>   drivers/net/usb/ax88172a.c     |  14 ----
>>>   4 files changed, 122 insertions(+), 58 deletions(-)
>>>
>>> diff --git a/drivers/net/usb/asix.h b/drivers/net/usb/asix.h
>>> index edb94efd265e..2122d302e643 100644
>>> --- a/drivers/net/usb/asix.h
>>> +++ b/drivers/net/usb/asix.h
>>> @@ -25,6 +25,7 @@
>>>   #include <linux/usb/usbnet.h>
>>>   #include <linux/slab.h>
>>>   #include <linux/if_vlan.h>
>>> +#include <linux/phy.h>
>>>   
>>>   #define DRIVER_VERSION "22-Dec-2011"
>>>   #define DRIVER_NAME "asix"
>>> @@ -178,6 +179,10 @@ struct asix_common_private {
>>>   	u16 presvd_phy_advertise;
>>>   	u16 presvd_phy_bmcr;
>>>   	struct asix_rx_fixup_info rx_fixup_info;
>>> +	struct mii_bus *mdio;
>>> +	struct phy_device *phydev;
>>> +	u16 phy_addr;
>>> +	char phy_name[20];
>>>   };
>>>   
>>>   extern const struct driver_info ax88172a_info;
>>> @@ -214,6 +219,7 @@ int asix_write_rx_ctl(struct usbnet *dev, u16 mode, int in_pm);
>>>   
>>>   u16 asix_read_medium_status(struct usbnet *dev, int in_pm);
>>>   int asix_write_medium_mode(struct usbnet *dev, u16 mode, int in_pm);
>>> +void asix_adjust_link(struct net_device *netdev);
>>>   
>>>   int asix_write_gpio(struct usbnet *dev, u16 value, int sleep, int in_pm);
>>>   
>>> @@ -222,6 +228,9 @@ void asix_set_multicast(struct net_device *net);
>>>   int asix_mdio_read(struct net_device *netdev, int phy_id, int loc);
>>>   void asix_mdio_write(struct net_device *netdev, int phy_id, int loc, int val);
>>>   
>>> +int asix_mdio_bus_read(struct mii_bus *bus, int phy_id, int regnum);
>>> +int asix_mdio_bus_write(struct mii_bus *bus, int phy_id, int regnum, u16 val);
>>> +
>>>   int asix_mdio_read_nopm(struct net_device *netdev, int phy_id, int loc);
>>>   void asix_mdio_write_nopm(struct net_device *netdev, int phy_id, int loc,
>>>   			  int val);
>>> diff --git a/drivers/net/usb/asix_common.c b/drivers/net/usb/asix_common.c
>>> index e1109f1a8dd5..085bc8281082 100644
>>> --- a/drivers/net/usb/asix_common.c
>>> +++ b/drivers/net/usb/asix_common.c
>>> @@ -384,6 +384,27 @@ int asix_write_medium_mode(struct usbnet *dev, u16 mode, int in_pm)
>>>   	return ret;
>>>   }
>>>   
>>> +/* set MAC link settings according to information from phylib */
>>> +void asix_adjust_link(struct net_device *netdev)
>>> +{
>>> +	struct phy_device *phydev = netdev->phydev;
>>> +	struct usbnet *dev = netdev_priv(netdev);
>>> +	u16 mode = 0;
>>> +
>>> +	if (phydev->link) {
>>> +		mode = AX88772_MEDIUM_DEFAULT;
>>> +
>>> +		if (phydev->duplex == DUPLEX_HALF)
>>> +			mode &= ~AX_MEDIUM_FD;
>>> +
>>> +		if (phydev->speed != SPEED_100)
>>> +			mode &= ~AX_MEDIUM_PS;
>>> +	}
>>> +
>>> +	asix_write_medium_mode(dev, mode, 0);
>>> +	phy_print_status(phydev);
>>> +}
>>> +
>>>   int asix_write_gpio(struct usbnet *dev, u16 value, int sleep, int in_pm)
>>>   {
>>>   	int ret;
>>> @@ -506,6 +527,22 @@ void asix_mdio_write(struct net_device *netdev, int phy_id, int loc, int val)
>>>   	mutex_unlock(&dev->phy_mutex);
>>>   }
>>>   
>>> +/* MDIO read and write wrappers for phylib */
>>> +int asix_mdio_bus_read(struct mii_bus *bus, int phy_id, int regnum)
>>> +{
>>> +	struct usbnet *priv = bus->priv;
>>> +
>>> +	return asix_mdio_read(priv->net, phy_id, regnum);
>>> +}
>>> +
>>> +int asix_mdio_bus_write(struct mii_bus *bus, int phy_id, int regnum, u16 val)
>>> +{
>>> +	struct usbnet *priv = bus->priv;
>>> +
>>> +	asix_mdio_write(priv->net, phy_id, regnum, val);
>>> +	return 0;
>>> +}
>>> +
>>>   int asix_mdio_read_nopm(struct net_device *netdev, int phy_id, int loc)
>>>   {
>>>   	struct usbnet *dev = netdev_priv(netdev);
>>> diff --git a/drivers/net/usb/asix_devices.c b/drivers/net/usb/asix_devices.c
>>> index 00b6ac0570eb..e4cd85e38edd 100644
>>> --- a/drivers/net/usb/asix_devices.c
>>> +++ b/drivers/net/usb/asix_devices.c
>>> @@ -285,7 +285,7 @@ static int ax88172_bind(struct usbnet *dev, struct usb_interface *intf)
>>>   
>>>   static const struct ethtool_ops ax88772_ethtool_ops = {
>>>   	.get_drvinfo		= asix_get_drvinfo,
>>> -	.get_link		= asix_get_link,
>>> +	.get_link		= usbnet_get_link,
>>>   	.get_msglevel		= usbnet_get_msglevel,
>>>   	.set_msglevel		= usbnet_set_msglevel,
>>>   	.get_wol		= asix_get_wol,
>>> @@ -293,37 +293,15 @@ static const struct ethtool_ops ax88772_ethtool_ops = {
>>>   	.get_eeprom_len		= asix_get_eeprom_len,
>>>   	.get_eeprom		= asix_get_eeprom,
>>>   	.set_eeprom		= asix_set_eeprom,
>>> -	.nway_reset		= usbnet_nway_reset,
>>> -	.get_link_ksettings	= usbnet_get_link_ksettings_mii,
>>> -	.set_link_ksettings	= usbnet_set_link_ksettings_mii,
>>> +	.nway_reset		= phy_ethtool_nway_reset,
>>> +	.get_link_ksettings	= phy_ethtool_get_link_ksettings,
>>> +	.set_link_ksettings	= phy_ethtool_set_link_ksettings,
>>>   };
>>>   
>>> -static int ax88772_link_reset(struct usbnet *dev)
>>> -{
>>> -	u16 mode;
>>> -	struct ethtool_cmd ecmd = { .cmd = ETHTOOL_GSET };
>>> -
>>> -	mii_check_media(&dev->mii, 1, 1);
>>> -	mii_ethtool_gset(&dev->mii, &ecmd);
>>> -	mode = AX88772_MEDIUM_DEFAULT;
>>> -
>>> -	if (ethtool_cmd_speed(&ecmd) != SPEED_100)
>>> -		mode &= ~AX_MEDIUM_PS;
>>> -
>>> -	if (ecmd.duplex != DUPLEX_FULL)
>>> -		mode &= ~AX_MEDIUM_FD;
>>> -
>>> -	netdev_dbg(dev->net, "ax88772_link_reset() speed: %u duplex: %d setting mode to 0x%04x\n",
>>> -		   ethtool_cmd_speed(&ecmd), ecmd.duplex, mode);
>>> -
>>> -	asix_write_medium_mode(dev, mode, 0);
>>> -
>>> -	return 0;
>>> -}
>>> -
>>>   static int ax88772_reset(struct usbnet *dev)
>>>   {
>>>   	struct asix_data *data = (struct asix_data *)&dev->data;
>>> +	struct asix_common_private *priv = dev->driver_priv;
>>>   	int ret;
>>>   
>>>   	/* Rewrite MAC address */
>>> @@ -342,6 +320,8 @@ static int ax88772_reset(struct usbnet *dev)
>>>   	if (ret < 0)
>>>   		goto out;
>>>   
>>> +	phy_start(priv->phydev);
>>> +
>>>   	return 0;
>>>   
>>>   out:
>>> @@ -586,7 +566,7 @@ static const struct net_device_ops ax88772_netdev_ops = {
>>>   	.ndo_get_stats64	= dev_get_tstats64,
>>>   	.ndo_set_mac_address 	= asix_set_mac_address,
>>>   	.ndo_validate_addr	= eth_validate_addr,
>>> -	.ndo_do_ioctl		= asix_ioctl,
>>> +	.ndo_do_ioctl		= phy_do_ioctl_running,
>>>   	.ndo_set_rx_mode        = asix_set_multicast,
>>>   };
>>>   
>>> @@ -677,12 +657,57 @@ static int asix_resume(struct usb_interface *intf)
>>>   	return usbnet_resume(intf);
>>>   }
>>>   
>>> +static int ax88772_init_mdio(struct usbnet *dev)
>>> +{
>>> +	struct asix_common_private *priv = dev->driver_priv;
>>> +
>>> +	priv->mdio = devm_mdiobus_alloc(&dev->udev->dev);
>>> +	if (!priv->mdio)
>>> +		return -ENOMEM;
>>> +
>>> +	priv->mdio->priv = dev;
>>> +	priv->mdio->read = &asix_mdio_bus_read;
>>> +	priv->mdio->write = &asix_mdio_bus_write;
>>> +	priv->mdio->name = "Asix MDIO Bus";
>>> +	/* mii bus name is usb-<usb bus number>-<usb device number> */
>>> +	snprintf(priv->mdio->id, MII_BUS_ID_SIZE, "usb-%03d:%03d",
>>> +		 dev->udev->bus->busnum, dev->udev->devnum);
>>> +
>>> +	return devm_mdiobus_register(&dev->udev->dev, priv->mdio);
>>> +}
>>> +
>>> +static int ax88772_init_phy(struct usbnet *dev)
>>> +{
>>> +	struct asix_common_private *priv = dev->driver_priv;
>>> +	int ret;
>>> +
>>> +	priv->phy_addr = asix_read_phy_addr(dev, true);
>>> +	if (priv->phy_addr < 0)
>>> +		return priv->phy_addr;
>>> +
>>> +	snprintf(priv->phy_name, sizeof(priv->phy_name), PHY_ID_FMT,
>>> +		 priv->mdio->id, priv->phy_addr);
>>> +
>>> +	priv->phydev = phy_connect(dev->net, priv->phy_name, &asix_adjust_link,
>>> +				   PHY_INTERFACE_MODE_INTERNAL);
>>> +	if (IS_ERR(priv->phydev)) {
>>> +		netdev_err(dev->net, "Could not connect to PHY device %s\n",
>>> +			   priv->phy_name);
>>> +		ret = PTR_ERR(priv->phydev);
>>> +		return ret;
>>> +	}
>>> +
>>> +	phy_attached_info(priv->phydev);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>>   static int ax88772_bind(struct usbnet *dev, struct usb_interface *intf)
>>>   {
>>> -	int ret, i;
>>>   	u8 buf[ETH_ALEN] = {0}, chipcode = 0;
>>> -	u32 phyid;
>>>   	struct asix_common_private *priv;
>>> +	int ret, i;
>>> +	u32 phyid;
>>>   
>>>   	usbnet_get_endpoints(dev, intf);
>>>   
>>> @@ -714,17 +739,6 @@ static int ax88772_bind(struct usbnet *dev, struct usb_interface *intf)
>>>   
>>>   	asix_set_netdev_dev_addr(dev, buf);
>>>   
>>> -	/* Initialize MII structure */
>>> -	dev->mii.dev = dev->net;
>>> -	dev->mii.mdio_read = asix_mdio_read;
>>> -	dev->mii.mdio_write = asix_mdio_write;
>>> -	dev->mii.phy_id_mask = 0x1f;
>>> -	dev->mii.reg_num_mask = 0x1f;
>>> -
>>> -	dev->mii.phy_id = asix_read_phy_addr(dev, true);
>>> -	if (dev->mii.phy_id < 0)
>>> -		return dev->mii.phy_id;
>>> -
>>>   	dev->net->netdev_ops = &ax88772_netdev_ops;
>>>   	dev->net->ethtool_ops = &ax88772_ethtool_ops;
>>>   	dev->net->needed_headroom = 4; /* cf asix_tx_fixup() */
>>> @@ -768,11 +782,31 @@ static int ax88772_bind(struct usbnet *dev, struct usb_interface *intf)
>>>   		priv->suspend = ax88772_suspend;
>>>   	}
>>>   
>>> +	ret = ax88772_init_mdio(dev);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	return ax88772_init_phy(dev);
>>> +}
>>> +
>>> +static int ax88772_stop(struct usbnet *dev)
>>> +{
>>> +	struct asix_common_private *priv = dev->driver_priv;
>>> +
>>> +	/* On unplugged USB, we will get MDIO communication errors and the
>>> +	 * PHY will be set in to PHY_HALTED state.
>>> +	 */
>>> +	if (priv->phydev->state != PHY_HALTED)
>>> +		phy_stop(priv->phydev);
>>> +
>>>   	return 0;
>>>   }
>>>   
>>>   static void ax88772_unbind(struct usbnet *dev, struct usb_interface *intf)
>>>   {
>>> +	struct asix_common_private *priv = dev->driver_priv;
>>> +
>>> +	phy_disconnect(priv->phydev);
>>>   	asix_rx_fixup_common_free(dev->driver_priv);
>>>   }
>>>   
>>> @@ -1161,8 +1195,8 @@ static const struct driver_info ax88772_info = {
>>>   	.bind = ax88772_bind,
>>>   	.unbind = ax88772_unbind,
>>>   	.status = asix_status,
>>> -	.link_reset = ax88772_link_reset,
>>>   	.reset = ax88772_reset,
>>> +	.stop = ax88772_stop,
>>>   	.flags = FLAG_ETHER | FLAG_FRAMING_AX | FLAG_LINK_INTR | FLAG_MULTI_PACKET,
>>>   	.rx_fixup = asix_rx_fixup_common,
>>>   	.tx_fixup = asix_tx_fixup,
>>> @@ -1173,7 +1207,6 @@ static const struct driver_info ax88772b_info = {
>>>   	.bind = ax88772_bind,
>>>   	.unbind = ax88772_unbind,
>>>   	.status = asix_status,
>>> -	.link_reset = ax88772_link_reset,
>>>   	.reset = ax88772_reset,
>>>   	.flags = FLAG_ETHER | FLAG_FRAMING_AX | FLAG_LINK_INTR |
>>>   	         FLAG_MULTI_PACKET,
>>> @@ -1209,7 +1242,6 @@ static const struct driver_info hg20f9_info = {
>>>   	.bind = ax88772_bind,
>>>   	.unbind = ax88772_unbind,
>>>   	.status = asix_status,
>>> -	.link_reset = ax88772_link_reset,
>>>   	.reset = ax88772_reset,
>>>   	.flags = FLAG_ETHER | FLAG_FRAMING_AX | FLAG_LINK_INTR |
>>>   	         FLAG_MULTI_PACKET,
>>> diff --git a/drivers/net/usb/ax88172a.c b/drivers/net/usb/ax88172a.c
>>> index c8ca5187eece..2e2081346740 100644
>>> --- a/drivers/net/usb/ax88172a.c
>>> +++ b/drivers/net/usb/ax88172a.c
>>> @@ -25,20 +25,6 @@ struct ax88172a_private {
>>>   	struct asix_rx_fixup_info rx_fixup_info;
>>>   };
>>>   
>>> -/* MDIO read and write wrappers for phylib */
>>> -static int asix_mdio_bus_read(struct mii_bus *bus, int phy_id, int regnum)
>>> -{
>>> -	return asix_mdio_read(((struct usbnet *)bus->priv)->net, phy_id,
>>> -			      regnum);
>>> -}
>>> -
>>> -static int asix_mdio_bus_write(struct mii_bus *bus, int phy_id, int regnum,
>>> -			       u16 val)
>>> -{
>>> -	asix_mdio_write(((struct usbnet *)bus->priv)->net, phy_id, regnum, val);
>>> -	return 0;
>>> -}
>>> -
>>>   /* set MAC link settings according to information from phylib */
>>>   static void ax88172a_adjust_link(struct net_device *netdev)
>>>   {
>>
>> Best regards
>> -- 
>> Marek Szyprowski, PhD
>> Samsung R&D Institute Poland
>>
>>
> 

