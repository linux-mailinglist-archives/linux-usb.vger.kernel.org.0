Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15DF88F449
	for <lists+linux-usb@lfdr.de>; Thu, 15 Aug 2019 21:18:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731969AbfHOTSV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Aug 2019 15:18:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48574 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731941AbfHOTSV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 15 Aug 2019 15:18:21 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 1202A2A09B9;
        Thu, 15 Aug 2019 19:18:21 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-117-92.ams2.redhat.com [10.36.117.92])
        by smtp.corp.redhat.com (Postfix) with ESMTP id EC99561F21;
        Thu, 15 Aug 2019 19:18:19 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org
Subject: [PATCH 3/3] usb: typec: fusb302: Call fusb302_debugfs_init earlier
Date:   Thu, 15 Aug 2019 21:18:15 +0200
Message-Id: <20190815191815.755606-3-hdegoede@redhat.com>
In-Reply-To: <20190815191815.755606-1-hdegoede@redhat.com>
References: <20190815191815.755606-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Thu, 15 Aug 2019 19:18:21 +0000 (UTC)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tcpm_register_port() will call some of the fusb302 code's callbacks
wich in turn will call fusb302_log(). So we need to call
fusb302_debugfs_init() before we call tcpm_register_port().

This fixes the following warning, which was caused by the logbuffer_lock
not yet being initialized (which is done by fusb302_debugfs_init):

 DEBUG_LOCKS_WARN_ON(lock->magic != lock)
 WARNING: CPU: 0 PID: 1306 at kernel/locking/mutex.c:912 __mutex_lock+0x978/0x9a0
 Modules linked in: fusb302(+) tcpm pi3usb30532 typec bq24190_charger snd_soc_sst_cht_bsw_rt5645 mei_hdcp dwc3 intel_rapl_msr udc_core ulpi gpio_keys intel_powerclamp coretemp kvm_intel brcmfmac kvm brcmutil joydev cfg80211 wdat_wdt irqbypass pcspkr intel_cstate extcon_intel_cht_wc i2c_cht_wc(E) snd_intel_sst_acpi snd_intel_sst_core snd_soc_rt5645 snd_soc_sst_atom_hifi2_platform snd_soc_acpi_intel_match snd_soc_rl6231 snd_soc_acpi intel_xhci_usb_role_switch roles hci_uart snd_soc_core btqca mei_txe btrtl processor_thermal_device mei snd_hdmi_lpe_audio lpc_ich snd_compress btbcm intel_rapl_common ac97_bus dwc3_pci snd_pcm_dmaengine intel_soc_dts_iosf btintel snd_seq bluetooth snd_seq_device snd_pcm intel_cht_int33fe_musb snd_timer intel_cht_int33fe_typec intel_hid intel_cht_int33fe_common sparse_keymap snd ecdh_generic goodix rfkill soundcore ecc spi_pxa2xx_platform max17042_battery dw_dmac int3406_thermal dptf_power acpi_pad soc_button_array int3400_thermal int3403_thermal
  gpd_pocket_fan intel_int0002_vgpio int340x_thermal_zone acpi_thermal_rel dm_crypt mmc_block i915 crct10dif_pclmul crc32_pclmul crc32c_intel ghash_clmulni_intel i2c_algo_bit drm_kms_helper drm video sdhci_acpi sdhci mmc_core pwm_lpss_platform pwm_lpss i2c_dev
 CPU: 0 PID: 1306 Comm: systemd-udevd Tainted: G            E     5.3.0-rc4+ #83
 Hardware name: Default string Default string/Default string, BIOS 5.11 06/28/2017
 RIP: 0010:__mutex_lock+0x978/0x9a0
 Code: c0 0f 84 26 f7 ff ff 44 8b 05 24 25 c8 00 45 85 c0 0f 85 16 f7 ff ff 48 c7 c6 da 55 2f ae 48 c7 c7 98 8c 2d ae e8 a0 f9 5c ff <0f> 0b e9 fc f6 ff ff 4c 89 f0 4d 89 fe 49 89 c7 e9 cf fa ff ff e8
 RSP: 0018:ffffb7a8c0523800 EFLAGS: 00010286
 RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
 RDX: 0000000000000002 RSI: 0000000000000001 RDI: 0000000000000246
 RBP: ffffb7a8c05238c0 R08: 0000000000000000 R09: 0000000000000000
 R10: ffffb7a8c0523648 R11: 0000000000000030 R12: 0000000000000000
 R13: ffffb7a8c0523990 R14: ffff9bf22f70c028 R15: ffff9bf22f70c360
 FS:  00007f39ca234940(0000) GS:ffff9bf237400000(0000) knlGS:0000000000000000
 CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
 CR2: 00007f1f108481a0 CR3: 0000000271f28000 CR4: 00000000001006f0
 Call Trace:
  ? find_held_lock+0x39/0x90
  ? _fusb302_log+0x81/0x1d0 [fusb302]
  ? vsnprintf+0x3aa/0x4f0
  ? _fusb302_log+0x81/0x1d0 [fusb302]
  _fusb302_log+0x81/0x1d0 [fusb302]
 ...

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/usb/typec/tcpm/fusb302.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
index 69a2afaf8f68..c7769fa73148 100644
--- a/drivers/usb/typec/tcpm/fusb302.c
+++ b/drivers/usb/typec/tcpm/fusb302.c
@@ -1726,6 +1726,7 @@ static int fusb302_probe(struct i2c_client *client,
 	INIT_WORK(&chip->irq_work, fusb302_irq_work);
 	INIT_DELAYED_WORK(&chip->bc_lvl_handler, fusb302_bc_lvl_handler_work);
 	init_tcpc_dev(&chip->tcpc_dev);
+	fusb302_debugfs_init(chip);
 
 	if (client->irq) {
 		chip->gpio_int_n_irq = client->irq;
@@ -1758,7 +1759,6 @@ static int fusb302_probe(struct i2c_client *client,
 		goto tcpm_unregister_port;
 	}
 	enable_irq_wake(chip->gpio_int_n_irq);
-	fusb302_debugfs_init(chip);
 	i2c_set_clientdata(client, chip);
 
 	return ret;
@@ -1767,6 +1767,7 @@ static int fusb302_probe(struct i2c_client *client,
 	tcpm_unregister_port(chip->tcpm_port);
 	fwnode_handle_put(chip->tcpc_dev.fwnode);
 destroy_workqueue:
+	fusb302_debugfs_exit(chip);
 	destroy_workqueue(chip->wq);
 
 	return ret;
-- 
2.23.0.rc2

