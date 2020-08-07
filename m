Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7C1723E612
	for <lists+linux-usb@lfdr.de>; Fri,  7 Aug 2020 04:56:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726049AbgHGC4O (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Aug 2020 22:56:14 -0400
Received: from mga17.intel.com ([192.55.52.151]:23243 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725947AbgHGC4O (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 6 Aug 2020 22:56:14 -0400
IronPort-SDR: AcFZtGN0+PSCGm3q2E+QUQMRMCi9jzEEDGJe1T/tCMJ5Ey7hYNjyLeT4yb1u3QReyhHbI7GqK7
 D6oTWcbQjOtg==
X-IronPort-AV: E=McAfee;i="6000,8403,9705"; a="133056192"
X-IronPort-AV: E=Sophos;i="5.75,443,1589266800"; 
   d="gz'50?scan'50,208,50";a="133056192"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2020 19:31:11 -0700
IronPort-SDR: upnqjZvyK/UoRRrTQegUNqtmkLtmw4CV6ZrdMLFoupDQJlZCoKmCIjCA7qS+DRxa18RooY7mVS
 Mv8bvP04tswQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,443,1589266800"; 
   d="gz'50?scan'50,208,50";a="333404743"
Received: from lkp-server02.sh.intel.com (HELO 37a337f97289) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 06 Aug 2020 19:31:08 -0700
Received: from kbuild by 37a337f97289 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1k3sA0-0001ww-8O; Fri, 07 Aug 2020 02:31:08 +0000
Date:   Fri, 7 Aug 2020 10:30:39 +0800
From:   kernel test robot <lkp@intel.com>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     kbuild-all@lists.01.org, John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 5/7] usb: dwc3: gadget: Account for extra TRB
Message-ID: <202008071005.qHssttRh%lkp@intel.com>
References: <cdd5ae526c65893998898cfb0734161df7048554.1596674377.git.thinhn@synopsys.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="/04w6evG8XlLl3ft"
Content-Disposition: inline
In-Reply-To: <cdd5ae526c65893998898cfb0734161df7048554.1596674377.git.thinhn@synopsys.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--/04w6evG8XlLl3ft
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Thinh,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on e3ee0e740c3887d2293e8d54a8707218d70d86ca]

url:    https://github.com/0day-ci/linux/commits/Thinh-Nguyen/usb-dwc3-gadget-Fix-TRB-preparation/20200806-084719
base:    e3ee0e740c3887d2293e8d54a8707218d70d86ca
config: mips-randconfig-r005-20200807 (attached as .config)
compiler: mipsel-linux-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=mips 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/usb/dwc3/gadget.c: In function 'dwc3_prepare_one_trb_sg':
   drivers/usb/dwc3/gadget.c:1177:16: warning: unused variable 'rem' [-Wunused-variable]
    1177 |   unsigned int rem = length % maxp;
         |                ^~~
   drivers/usb/dwc3/gadget.c: In function 'dwc3_prepare_trbs':
>> drivers/usb/dwc3/gadget.c:1306:1: warning: control reaches end of non-void function [-Wreturn-type]
    1306 | }
         | ^

vim +1306 drivers/usb/dwc3/gadget.c

5ee85d890f8de5c Felipe Balbi         2016-05-13  1235  
5ee85d890f8de5c Felipe Balbi         2016-05-13  1236  /*
5ee85d890f8de5c Felipe Balbi         2016-05-13  1237   * dwc3_prepare_trbs - setup TRBs from requests
5ee85d890f8de5c Felipe Balbi         2016-05-13  1238   * @dep: endpoint for which requests are being prepared
5ee85d890f8de5c Felipe Balbi         2016-05-13  1239   *
5ee85d890f8de5c Felipe Balbi         2016-05-13  1240   * The function goes through the requests list and sets up TRBs for the
5ee85d890f8de5c Felipe Balbi         2016-05-13  1241   * transfers. The function returns once there are no more TRBs available or
5ee85d890f8de5c Felipe Balbi         2016-05-13  1242   * it runs out of requests.
5ee85d890f8de5c Felipe Balbi         2016-05-13  1243   */
e1a8607778079c1 Thinh Nguyen         2020-08-05  1244  static int dwc3_prepare_trbs(struct dwc3_ep *dep)
5ee85d890f8de5c Felipe Balbi         2016-05-13  1245  {
5ee85d890f8de5c Felipe Balbi         2016-05-13  1246  	struct dwc3_request	*req, *n;
e1a8607778079c1 Thinh Nguyen         2020-08-05  1247  	int ret = 0;
5ee85d890f8de5c Felipe Balbi         2016-05-13  1248  
5ee85d890f8de5c Felipe Balbi         2016-05-13  1249  	BUILD_BUG_ON_NOT_POWER_OF_2(DWC3_TRB_NUM);
5ee85d890f8de5c Felipe Balbi         2016-05-13  1250  
d86c5a676e5b1ee Felipe Balbi         2016-10-25  1251  	/*
d86c5a676e5b1ee Felipe Balbi         2016-10-25  1252  	 * We can get in a situation where there's a request in the started list
d86c5a676e5b1ee Felipe Balbi         2016-10-25  1253  	 * but there weren't enough TRBs to fully kick it in the first time
d86c5a676e5b1ee Felipe Balbi         2016-10-25  1254  	 * around, so it has been waiting for more TRBs to be freed up.
d86c5a676e5b1ee Felipe Balbi         2016-10-25  1255  	 *
d86c5a676e5b1ee Felipe Balbi         2016-10-25  1256  	 * In that case, we should check if we have a request with pending_sgs
d86c5a676e5b1ee Felipe Balbi         2016-10-25  1257  	 * in the started list and prepare TRBs for that request first,
d86c5a676e5b1ee Felipe Balbi         2016-10-25  1258  	 * otherwise we will prepare TRBs completely out of order and that will
d86c5a676e5b1ee Felipe Balbi         2016-10-25  1259  	 * break things.
d86c5a676e5b1ee Felipe Balbi         2016-10-25  1260  	 */
d86c5a676e5b1ee Felipe Balbi         2016-10-25  1261  	list_for_each_entry(req, &dep->started_list, list) {
e1a8607778079c1 Thinh Nguyen         2020-08-05  1262  		if (req->num_pending_sgs > 0) {
e1a8607778079c1 Thinh Nguyen         2020-08-05  1263  			ret = dwc3_prepare_one_trb_sg(dep, req);
e1a8607778079c1 Thinh Nguyen         2020-08-05  1264  			if (ret)
e1a8607778079c1 Thinh Nguyen         2020-08-05  1265  				return ret;
e1a8607778079c1 Thinh Nguyen         2020-08-05  1266  		}
63c7bb299fc9c43 Thinh Nguyen         2020-05-15  1267  
63c7bb299fc9c43 Thinh Nguyen         2020-05-15  1268  		/*
63c7bb299fc9c43 Thinh Nguyen         2020-05-15  1269  		 * Don't prepare beyond a transfer. In DWC_usb32, its transfer
63c7bb299fc9c43 Thinh Nguyen         2020-05-15  1270  		 * burst capability may try to read and use TRBs beyond the
63c7bb299fc9c43 Thinh Nguyen         2020-05-15  1271  		 * active transfer instead of stopping.
63c7bb299fc9c43 Thinh Nguyen         2020-05-15  1272  		 */
63c7bb299fc9c43 Thinh Nguyen         2020-05-15  1273  		if (dep->stream_capable && req->request.is_last)
e1a8607778079c1 Thinh Nguyen         2020-08-05  1274  			return 0;
d86c5a676e5b1ee Felipe Balbi         2016-10-25  1275  	}
d86c5a676e5b1ee Felipe Balbi         2016-10-25  1276  
5ee85d890f8de5c Felipe Balbi         2016-05-13  1277  	list_for_each_entry_safe(req, n, &dep->pending_list, list) {
cdb55b39fab82b5 Felipe Balbi         2017-05-17  1278  		struct dwc3	*dwc = dep->dwc;
cdb55b39fab82b5 Felipe Balbi         2017-05-17  1279  
cdb55b39fab82b5 Felipe Balbi         2017-05-17  1280  		ret = usb_gadget_map_request_by_dev(dwc->sysdev, &req->request,
cdb55b39fab82b5 Felipe Balbi         2017-05-17  1281  						    dep->direction);
cdb55b39fab82b5 Felipe Balbi         2017-05-17  1282  		if (ret)
e1a8607778079c1 Thinh Nguyen         2020-08-05  1283  			return ret;
cdb55b39fab82b5 Felipe Balbi         2017-05-17  1284  
cdb55b39fab82b5 Felipe Balbi         2017-05-17  1285  		req->sg			= req->request.sg;
a31e63b608ff78c Anurag Kumar Vulisha 2018-03-27  1286  		req->start_sg		= req->sg;
c96e6725db9d6a0 Anurag Kumar Vulisha 2018-03-27  1287  		req->num_queued_sgs	= 0;
cdb55b39fab82b5 Felipe Balbi         2017-05-17  1288  		req->num_pending_sgs	= req->request.num_mapped_sgs;
cdb55b39fab82b5 Felipe Balbi         2017-05-17  1289  
1f512119a08c0d4 Felipe Balbi         2016-08-12  1290  		if (req->num_pending_sgs > 0)
e1a8607778079c1 Thinh Nguyen         2020-08-05  1291  			ret = dwc3_prepare_one_trb_sg(dep, req);
5ee85d890f8de5c Felipe Balbi         2016-05-13  1292  		else
e1a8607778079c1 Thinh Nguyen         2020-08-05  1293  			ret = dwc3_prepare_one_trb_linear(dep, req);
5ee85d890f8de5c Felipe Balbi         2016-05-13  1294  
e1a8607778079c1 Thinh Nguyen         2020-08-05  1295  		if (ret)
e1a8607778079c1 Thinh Nguyen         2020-08-05  1296  			return ret;
aefe3d232b6629c Thinh Nguyen         2020-05-05  1297  
aefe3d232b6629c Thinh Nguyen         2020-05-05  1298  		/*
aefe3d232b6629c Thinh Nguyen         2020-05-05  1299  		 * Don't prepare beyond a transfer. In DWC_usb32, its transfer
aefe3d232b6629c Thinh Nguyen         2020-05-05  1300  		 * burst capability may try to read and use TRBs beyond the
aefe3d232b6629c Thinh Nguyen         2020-05-05  1301  		 * active transfer instead of stopping.
aefe3d232b6629c Thinh Nguyen         2020-05-05  1302  		 */
aefe3d232b6629c Thinh Nguyen         2020-05-05  1303  		if (dep->stream_capable && req->request.is_last)
e1a8607778079c1 Thinh Nguyen         2020-08-05  1304  			return 0;
72246da40f3719a Felipe Balbi         2011-08-19  1305  	}
72246da40f3719a Felipe Balbi         2011-08-19 @1306  }
72246da40f3719a Felipe Balbi         2011-08-19  1307  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--/04w6evG8XlLl3ft
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

H4sICLi1LF8AAy5jb25maWcAjDxbc+O2zu/9FZ7tSzvT3ebqTb9v8kBJlM1aEhWScuy8aNKs
d5tpLjuJ056eX38AUhdSgrx7Hk7XAAiCJIgbofz4w48z9rZ/frzd39/dPjz8O/uye9q93O53
n2af7x92/z9L5KyQZsYTYT4AcXb/9PafXx/vv77Ozj9cfDh6/3L3cbbavTztHmbx89Pn+y9v
MPr++emHH3+IZZGKRR3H9ZorLWRRG74xl+9w9O7h/QOyev/l7m720yKOf5799uH0w9E7b5TQ
NSAu/21Bi57T5W9Hp0dHLSJLOvjJ6dmR/V/HJ2PFokMfeeyXTNdM5/VCGtlP4iFEkYmC9yih
ruprqVY9JKpElhiR89qwKOO1lsoAFtb+42xhN/Jh9rrbv33tdyNScsWLGjZD56XHuxCm5sW6
ZgrWI3JhLk9PgEsrlcxLARMYrs3s/nX29LxHxt0GyJhl7RrfvaPANav8ZVrJa80y49EnPGVV
ZqwwBHgptSlYzi/f/fT0/LT7uSPQ18xbit7qtSjjEQD/G5sM4N2ySqnFps6vKl5xf1kdwTUz
8bIe4dtdUVLrOue5VNuaGcPiZT9rpXkmIn82VoES+2zsOcGpzl7f/nj993W/e+zPacELrkRs
D71UMvL0wEfppbymMTxNeWzEmtcsTeuc6RVNFy9FGepYInMmihCmRd4DlqxIQBkcHaJD2lSq
mCe1WSrOElEs/D3wZ054VC1SHW787unT7PnzYFeGcluVX+N5siwbLysGxVvxNS+MJpC51HVV
Jszw9qqY+8fdyyt1CsubuoRRMhGxv4pCIkbAJpBaY9EkZikWy1pxbVeg6KWPpGmFKRXneWmA
vbUKvRY38LXMqsIwtSWnbqgINW7HxxKGt3sSl9Wv5vb1r9kexJndgmiv+9v96+z27u757Wl/
//Sl3yUj4lUNA2oWWx6DM18LZQZoPA1CEtQKe7Y0o0gneBdiDrcOKAy5TgOarg0zmlqpFsHG
adEZl0RoNKEJeSTfsRl201RczfRYi2Ad2xpw/tzws+YbUC7qRLQj9ocPQLhIy6NRawI1AlUJ
p+BGsZh34jUrDlfSnc/K/cO776tOiWRwRcRqCbd/oOOdX0AHkILxEqm5PDnqFVEUZgVeIeUD
muPT4TXW8RJsjL3prcrquz93n94edi+zz7vb/dvL7tWCmxUR2M6OL5SsSu2LD0Y9XhCiR9mq
IfepHcTJRPkJhy5F4tmjBqiSnBGsUriTN1yRGt6QJHwtYtoANRSgtsNrEhJEZToSyFplz3nK
eNWhmAlkRWesS9AeTUux5PGqlHCmaPKMVLSw7iQxPLCz0DRbnWoQDUxVDIab2mTFM7b1Agw4
KNghG0uoJAx0FMuBm5YV+CkvzlBJvbgRwcECKALQCSkUILObnE3hNrQLsKPkNOqM0jop0Tw3
V6/f4LiWJdhLccPR6aKrgv/krIjJaGVAreEfvk+HSAFCsgRuLUwFpgJPu+YYCxbMYGDnzXyQ
kDJobegV/AYDGPPS2MgcjZB3er5iOjPZ/87BXgsIr5QvkV5wg0FO3UQFB9SIoGjwqYts+qlc
gOictQe1dmr4uy5y4Qe4wVHxLIXNmrgBEdNwJBUtUgVJS8/W/gRL4u1OKf0YSItFwbLU03gr
vQX00mBslFK3SC/B8gVBq6B1Vci6gmUvSCRL1gKW1Gw05QJglogpJewhNrAV0m5zPYbUQZjX
Qe2+4b3HMDdQnrqPDTuhUGOsrycXrjS/8qmtGbRQcoUgPk8S0hDZm4RXsR6GoBYIYtTrHGST
ntMu4+Ojs9aPNelsuXv5/PzyePt0t5vxv3dPEG8wcGUxRhwQILoozWPsZiPjl+/k2Eqzzh0z
FxEGqo+JIDOQRXrqrzMW5Dk6qyL6+mUyonQOxoNCqAVvo7GQG2DRHWZCgyOBCypzmvuySlNI
S0oGjOz+MvA5E7GwTEU20t5mt8LMudNYYSMEu+357d2f9087oHjY3TXVhj50AMI2TCFntwQs
A7eX06E6Ux9puFmenE9hPv5G25ZvihPF+dnHzWYKNz+dwFnGsYwgh6fxkA7DgcYYjA+8Qkjz
O7uhXaXFwinxYkL0jEGOQF9QOzaTslhoWZzSDjygOeHpt4nmZ9M0Jegn/HfCXtrdgmtv6Hih
4RAfknStzo4nzqLYQPRpopOTo8Poc8ryMbgJq9CXihqCHlqUBklraIO8OIA8pUVskBNzimhr
eB2rpSgmgsiGgqmcT/j+joc8zOObBPoaZjlEkAljMq4r2vi0XMDASk1rQ0MSicUkk0LUE0JY
XTGb09+m7q3Dn03ixUpJI1a1is4nziNma1HltYwNx0KipG9nkeX1JlMQvTKVHKAoD1DYa1My
xbCIQAW12YqvwS2Y09Pzk94lOZ2uRZZhoSAsT0GsFmSqID6MP7m42BD8HfL06HwzHnJ6cXFK
Hw6gc/NxPnEbO/QxMWFiImA9qvE4MMoBrpkNNLzxW2OvNEyal9dcLJZeKN0VxWC/IgWZFRjs
II1yyZnMhQEfDOlebfM5P2qzuYliXhUytidy5kUIsVZxCHHOA7N3oo7HFGiorspSKoO1Oix/
ejEIZMy4P7FccsULbzXAyBbPOVPZdhSlYwXK3cyaF4lgRTiwm2+CxkqcHcNWwZY0ZYnzrlYW
hALehDjq9KRWx0He5iFOKKVr1jFkcAB94hdvQnnG4oR7gjCfvWEQiZlaaAax9frymNyk05MI
VGLFVcGzkN03SJZw08F+cldat9qkB4Hv/t+vu34XLRsv+IfgdFFxTYFcqoPB4tXl8dGRF+9h
SIj5bn22okPTnuJ4vqKC1J5gDjy8hAyL3WBTN/UNXFmpErgbx8f+huBRlYqn3PjPA4hpb19S
5WVtsmigbGnZbmY4DC4S4Kox0KlmwAhRBeeJxqK0zpkyljWk/7mIlWyC2oG0elvEA1mYFkmj
9EdjBJyQvrwgtQAr3i6lpNQIWRzPBzc/hYQOhsANxIqsf3GWN/UJVR8B+NnFgBAUgC7BA2oi
QEH255OjTs7nkwyPDkx2RIocbANTeFWWN941ubk86zZ0xTc8cFmxYnpp1YbizGPM0oJqpj1z
sBNpOT9rpyWGYm4q08HRg+KwsgRzCI4A3NCIL5Y2fIJpPw5e4jsp4zzBt0+4yjL/Pkp0kHxj
gDdVbRjxRK+VSSxQ+4bTN0B9sTpeJZy4ihjtr1zxfIQrF+5BNoM8OtOXJ86+RW+vs+evaJRf
Zz+VsfhlVsZ5LNgvMw7W9peZ/T8T/9wbPyCqEyXwDXVc6c/zanBz8pyVtSrchYRVF/2lpPBs
c3l8ThO0ef43+ARkjl23md+92s7xKJY09avOJZTP/+xeZo+3T7dfdo+7p33Lsd8iK9BSROBn
bJ6JNTuIn/0qXhNPaNQ8H91HZA438WTXsaY9R06FpWACy9xXrcmFdBGEo8g7CkB0OPHpYRcG
FiKoU7aQeiHXkBUnSVgcDdA5L6oJkTsaiOsnmC8hhW0qjq4UAlerE3GWvNz/3dam2qiUJvBj
Fbc6HzLaC8sxvX95/Of2JZym9cNC5TauAM8B2kkscCHlAhbREgav0g6FBVobztrLS7DgqXDB
ZWzL4e7xePfl5Xb2uRXtkxXN34AJghY9WlQvFuY8FUTmN1NldReTwjVkRW0TnnWi5eWgAeT2
BdKCPQSDby+79592X2Fe8iI5p4J74IVW6HkGMFvflK6EFuziygXqhJy/Y4CTscgPBG1ZKIYZ
0BGCDzFBTGevLLojbBQxoqijsMnDCiFALrREMK8ZoFbDpMFBFTckIijdW4gVwFr3pZSrARIz
EPhtxKKSFdFjoGG59sa4HojBsjDEgrDRiHTbPkKNCXAKDWF4VdiobsjDBdcyTevhyrFzKJdJ
03YzXKjiCwg3wAxa74XJsX1ML4fLb8rhox2hTtIirlkBOUMZY7KOFe6mGYhg0cQncBGzIJGc
gtuRVlw8Zx4b6SGbdqkQPcqeQ/RUzR5PFEIIe+or13rgo+G8gHEQpCF4orthqKpkZ4NPAWfW
7E/JY5EGjl4mVca1vQ8YbakwoWrY8w1qROHadXDBhFbZ0baEPn78G0cIAwI7AanR4aiLsWK0
XRZGlom8LtyAjG1lNVTfWJbbZhLIZPzkJINDrSNYF1jvZPwk4W4E7jG1rqaBTdXLgei4p+Ay
AkPS15exPuE9hVC2zamn0/qmklEXqjPCsVy//+P2dfdp9pcLLr++PH++f3D9M70DArImVaaf
JA6wCQTBHsUyqxaiCNoZPPDBJ49v+IquvGbqHB8ifTtqH+M0Pmz1JYNGcYOUwYKatBkjcDq0
d1RVcYiiNXGHOGgVdw2IE4/CLaWg3zIbNCqQAlt5iAYfna7BKUOAWXjdEbXIbZpHDq0K0EAw
x9s8khlNYpTIW7oVPnySfSnSv/DY/QBmwL6CDe4EonSsBViRq7CO0ve21Ooa3XOIwm6KSC9I
oOt0HMCxULhQwpBdGQ2qNsdHYzSWUpIxGMyCNCYLbOcYB1p17WucXVaT+9lrSjkAJLqO6M0Q
MmOQWMbbCWwsh7sInOr8aiiEe1IeNjz6x4Kl1pJRbQCIdv3ANUiituWwI4MkqFPQADSZPkeX
V92+7O/xUs8MJLteFAg7ZIQdy5I1dpIEjQMMQsGipyEEZWLT4/tdkToNwD3HXCzYYY6GKUEP
zll8cGiuE6kpcbCTMBF6NYhkINMF8XUVEUM0aIESut5czCmOFYy0+YfP1uuXyWlBg/evwxTg
P5W/uTSbauJ4+iidqfzwhmOWQ23AVq/nF/RBePeLmrrNgQdK5yt3fmUjKdGlL0L2LXuefgKd
kO5VAjuQwg55D7naRn4Q2YKjNLyW6VXdXuNR917fjByI0umlLo6D83e3T5eQraDjGgVgGGrY
VvLEEiGFniZR1y2B3Q7+n93d2/72D8ih8cOImW3k2HsbE4kizQ1GeAOePcLmXN52AShM7RpS
HStRmhEYHJsXlOJIrED6RY4pIV2lYPf4/PKvl9SPU9Cm8utV1wEAQXdiYzS47sMMMGXa1IvK
Azfd+AKv60B/ywwCxNLYoA4Cdn15NhgUob8MzIQDuBAzDtlRMPtIoDh6+8BJgY1TbDgc08d6
0AdkkwkjIev1u6C0tyNtJG0jaLBXYKYTdXl29Nu8pcByP3YE2aRkFTRzxRlnLp+kOs0UiBRm
2bHtTe1/dM2h3sVnVB+/hwWbyPTlxxZ008zQcbCALryC5K3ryOZ4+vRL/OSgqdbKyQEXZ9QL
3AH+Z98lPNAt6VfxySE32lC16yn6y3cP/z17N+R7U0qZ9SyjaprlgPQ0lVkyXtuASrvOte9j
evnuv6efnx8+jaRs2ZHux7Lo1Q7X4P1qxez4da103hwO1lXh4aqUU62KHTHaRkIaW8ax93pc
FnAv4utBSQKunn0Bw28QvNIQtltDZLbMmaIy8xJbQjDzZ5lvUaeNZn/dPUtd4MNtsUBNaR1H
sdv/8/zyF2SKY3sLBmzlD3e/IYRh3ioxsgl/gYMIzIqF4SA6fZlIazapym1TJt0awvHteEuc
yCYpbVc6N0Fi6YFHsrRn6faqGyJK10scM023sAFBGwXXECUYMnUAorLwP6Gyv+tkGZeDyRCM
9WW6x70hUEzReHu2pTiEXGD8yfOK6mRxFLWpiiKMTfUWHZxciYk2fjdwbcQkNpXVIVw/LT0B
HkvNltM4SKOnkaJE2zhx2v1yfWCo344uLltwyL5KymnVthT4qnmYArFwLtooSTd84uzwz0Wn
bcRyOpq4ivziYFdaa/CX7+7e/ri/exdyz5PzQYGj07r1PFTT9bzRddu1MKGqQOQ+JtBYxE8m
ijS4+vmho50fPNs5cbihDLko6Ud5ixUZ3V5nkQOF9lFamNGWAKyeK+pgLLqAtC+2karZlnw0
2qnhgXWgGSqz5jveiWtiCe3RTOM1X8zr7Ppb81kycEV0iOJ0oMwOM8pLUKype4/fKWNFH73d
hDEqTYlfR2st0q2/Ye3ocrm1pStwpPnQffek3WuBP94Bydvkqq7PLzt0jJCk7HcvUx+O94x6
lzpCwb9s++zjJAo/ZfPQ+B1IUdhgIoDiB2+g7DkkCY/eYhwCWCV8Te2Ax85+g5cGTjFA26oE
FaYHVKkpaWlroeKBaD0OBIwgha6Lb/LXYsDfeHtIHGK7i4us4jX5MRswKZgJmMLv0UIQ5pYQ
woYCISxnGtJwxRI+2M3x/RwJvHE0wNPq2sbmw6+zu+fHP+6fdp9mj89YSHil9GyDM6vVcOj+
9uXLbj81ounXC7XMJ3CbQ2xtP7jAj6coJ0oSp26ugxwVT4Ti9HkR5N6G04to6MDk5Hq0t4+3
+7s/D2wpfsSPebK1zTR/R0RdzTGVK6M8ei0Lh+xJEOFpPhlprvXITony/77DTKUYAyhm7fbZ
4Ia6iNhiaFMNKg1mY7M9SJJggWyADw0UBK0ja9aI0wMV/x00YgCHlQNKlN2tCeCNeR9AOx1D
fkPkQN2DEb2a0YF8gX8poVhkfMwBwjy6OHjgjJpD/Ht+6Bjp46LDmuC4Jkma45rTx9Wfwpw6
srm/n/Ops5m7rcLbgGPct94jgvHpzQ8e33zqAOaHT+DQBpPXZD7pyCIlksXEZ5oWheQ8OhCn
RaVb9tQ9T+KJsAnNQzyRHKpk4m0QImTyzST8iNPkEGpNpI6IzNjEJy+IjNTJ/IK2DdmJIVtQ
jZcPu20b/q7FIof1FlKW4Xuew+ZqWOq1iZRmg0gPQaRka1hSfXF0ckx/HpbwuODkn7LJgloS
/KTqg8ywbOXnYGtsbM14A/aONEnoXd9MfMmXsZJsP8ePkoKsZJ7J65KRf0WDc44rPw9KlT20
LrLmH/bLagixC0M+OnpDnGEavL053ER4r5uuJWvhrt52b7v7py+/Nu8owZ8PaajrOLoKImwL
XIYdxx041ZTet2in/wNgqYQcQ23qdUXNoYbPQQO8Tum+5B5P616LN/yK2vUOHaVjaeNIU6JC
jHKIE6OXDklNMoYmuilRjmaB/3Kq27UbqYaJmNvhK5z+wDi9ihoBR2PjpVxRvrrFX6Xk0eHf
JaCz1pYivfoOopgdnDyl9HVJnFop+BgIEpBw7NOhz3i6Pmd33xWCxsnuw+3r6/3n+7txegtO
YaROAMJeHjF1vRBvYlEkfEMNtfWJKZuABOl1uGSEVcE3SQ5gP2ofQ8PyeTerXpc0dD4Gp4MG
kRYeT//9kW5jSrog5rM+UNBGEhs0TfUi2WqnpTjIg03lVU6xROpd9iT2WnOSQuPfYpH4V9n8
Z07I/mzDR/A23kHbf1IFCJ8qYxRP/PsgE3wLSsk8fI6VeZqne3Oc4GuxdHDWE9k/BkISyZIX
a30tBsfQRhbE48P6Gy8PHT6DeCcKejNd14PPlUa0xSFfnW1hZFi2zku6yIOZu/baH5d6bK3t
mgeVpoAiO8UcCrPhKaorZaYvQBFr+hmhaaaydUHaWXgUrmo4cF1qg6/m2zr8cyjRVfDWgX8a
5HdBp+D2z4YYxVlOtIn5T2mz/e51P2jgtIKvzODPmnUpymjkAOG/zvVRbw6Jat8QU97e/bXb
z9Ttp/tnbP/cP989P/gfwkBIGQT98BvuHvaRZxBAT52JkpRLV1J3fx6PbT5AsPrULOHT7u/7
u/YzhuATjHwlJvoj5+WgB83b9CtulhMmM2JbUPpa4zedCfWm5REsk01oDCwGDnJ62P84e7Yl
t3Uc3/cr/LQ1WzWpY8n3h/NA3Wy2RUkRaVvuF1WfTs4kdXqSVHenZubvlyB1ISnQzu5DLgYg
3gkCIACmlXFmXIkVrnOzz8OSJLYTlGQsjo5qYKLYEEkBsL/Yvx+C3WLXj7kEzBJd6xjsYhCf
YzM2WUGaCYjnE5DctTYgJnkMbttwl2Nn2wNslqdQLL5loQ91jKogquR2UrsCSQGHCMhT5eDi
zWbu1q+AEIrsq0Ph8QJpRuFfMxUSgNm0WcxtltUGjRXyr2WzwlMmqMF+IN4wUIUvM+HcYgwz
zSvJFSEHz59Pz5+tPQVfHugiCLDlr1oXV+EqaMy1i5Q41HTi0Y2atqDIKhK0rpRBDEJkD17K
EwCGzuJGKI9nAjt1AmdxRDqo1ZoqJccbrTn128/ottM9uzztf6vT5uFu8MiuG3iGLcNACqQ0
QZmLPCRNawf8NMMVwDWYZyoTsV2g341KIo0IKfObHtymcYKLjCYR91ylSposJeKkvAccyUkH
rr78/Pz+/fv7lyn3H4sAn+7c6mct7N8fY2L9PsQ0EtZyMIAqI2AXmOn0eiCRPNXXoYGGCewC
0qSo7aTAPYonqByi0SdihvuOMDiLLB5roA5LFBzFvJrWr1BEHBb+1iuSPEcLXVyoHeJo4NRE
3Ri3rlWYWGAQIJOp27xfNw2KYfV50lhZTThfTOijSjLTBpmVDOcHGpuIPMBmcuFJfKXR+SmN
CXqzrwnO8o+9fXU/zHIA1PoXjJpHuwxx5Ilt8tBQGCmUN3n3oCHxZVIKriu8txJ5ROcUVkpu
3W73kFYzqR4KsXG2v7ACdZlfbRA1xYxsD5ZCa2q0CTJQCcVZmXjSmHYfAs9O8xJ8Wi+kLuQp
ijqb9tRxCrGVNNbh4GVxslS1gQziX2RHVcQ5+Hel+wQ9akZ6SG2T56ecSHGzy1uCFatzkTaQ
OIFiJ4TRLe26Y+XgGJG9hjvpX50QI+XAtAkwB7jLhrbZYnmHehRcboJD4kHlNFE5Qo1EKhcq
ofgFRXakaAJL0Ix2jnFmV43O/pYKtaumJ9BwgtPMlhBodkPRV2iv24TCuiJHWh3anHpsuhlm
qqg4kdq2Y8OjmcV4MR+aDpXIM1l5Y48FSCVXLTJj3jNC8/Js+7hInUmAo21nA0DK1sGUnb7b
axU+jaKKgQOOVepEDe5vFa7XxnRMzhB/eH56/TT74/Xrp38oaXIMPP/63FUzKwev06H5Jx1T
eUjzCnWplJMmWGWbd3pYyyASE50kuXSLhORO+ra+D7WudEgUoJ4g6LsyROG/fH/6pOL3+9G/
tEOeEBek/IITSFM9IuXWq8mYZGDMLjx+dVL6quo7VqiBHuK3zIEYKfGYRDevQNejgUHreNyz
GcDRHxEqfhHHOVBjWpRQrXKUeG7aOqm79tyXagIloOpiJPtk5RmdQ9Z+LHl7PMFrFa44rEog
kLuoL0eF+iPF6O97orS1Uw8MOdEgplvKoM7rC5K/W3Eo+ndLw3gC4zllViRHDzfD7TvYJZiA
GDMvbfp6zNcW+vJiy8YLFp+DXHxqZWY24wBklhaxdmdP0ZXj2b9DChstf1gbOqpjxkXU7ikI
7jV2jrKyEaavOTvQLszFyhjTF27w5VKyTzduf8DuC47mFxaW0iB/qlmeutiMMWk/nl7fXIuW
gJj8jQpr80T+Sgoz+M3TlrbU4Y/cbZScJZVxBKlhEjTXN1C18PQGCVK0K5nK4iten769vag7
nln+9B87aE7WFOVHuQknDVCBw96uKWxb4zE1mUDP+8zU+uBXWxuWLtrhDcEhcUsaGTrPEuzc
5ay1alEjXJpiFEDsWCaADOGJcm9oM3bP/2vCfqtL9lv28vT2Zfb85euPqY6r5jqjdpEPaZLG
DosAuOQi7rst3ffq8qFU8bmT2QB0UULDPesICCJ5dnV5SCusgNzA+xetJNynJUtFjQVZAAmw
logURyn1JeLQBnZPHGx4E7ucjgINEJhTSikqhAjUV0szGQaWSYkqmcKlXECm0JOgzhKqCZvs
T9Q6rvhCxHXyyfHNDP8a6rJG//gBhv4OCNGRmurpWXI8d6GVIFk2feySs7Srw5Wz6ex34C4l
hnfue7IScxowCfYVLXWAoV27Ix6OsJYUZXFlVlIchc2JqG0L+73R0E96fH7588Pz92/vT8p1
VhbltUBBNfASQZYTdctl9XhAtJeaCpWehma+dT8ST9Yfiw9VuDiGq7XDargIV85q4jmynqqD
BPr2m0j0FyNM/m5FKUiuNTEzzLPDprXKuwHYINyaxSneHeqDUEv/X9/++lB++xDDKPtUATUA
ZbxfGOYK7RgrpSv2e7CcQsXvy3Fa78+YWVNBVBK52uGSkkEDBgV2c6cn0h3engbJd45QTaa3
R4QN8O69Oxu6uWkcS9YK13PMDvLFCeRhFbts5tJOu2d+GqlMofpgevrXb/Lgf3p5+fwyA5rZ
n5q9yCF+/f7yMpk8VU4i+5FTpAKNaBPhjpzCghin6sDHTdE8PC432zlSdJeoHfqAFg4fLueA
vld8uIq6IcAr9yBZQ/GagY15maGi6O9+blPFUuvC31YZSIjcjmTIDce+vj0jswN/WQ+qjdND
+bEsuifZpg0Y0Vq2uBUvduujREWzzG/XEEVC7TFP2VKJ6Vex6mteyWJn/63/DSHX4+yfOngV
ZdWKzB6Bj1I2LAehaeAo9wueNKt0Su6AKr3CUsUlSXXCOaJOEZ0A2kuuclHxAwQdO9xXEURp
1D2XOD5j1eMgOQFzRVBAQCgLVpuTxAfAh2uV1pYOmQiDnZSWSUwqGaDZeh5plFgIqBd1mpoF
dNmyUdSxjB4sQHItCKNWA4blZMIsLbXM7CDlEnzQeVqfQQo3sz1oBDgnWTAwfllJyaUY76Rb
1YCWNNvtZmfFM/YoeThiXmk9ugAdzOhXl1bILKnPNFSc8hx+oLzi0TneJ1+DA9BNgqSOcLfT
of47eF8L4gQS31ZHESdnvAR4xwkGG8yLKEHnkuTr/NCCaBpyV5xZOuM/f/z4/vpu+CBKqHP+
K5COhyTCEuQU5nBhaNYAhcxIJE997hSWxQ5Axx+gQDU/OMZTjIR339gNHQOWcI8gczyGw8Kw
rfSqblpwyaskk+GL/DwP7XRMySpcNW1Slbiwn5wYu8JmRLFypHaLkC/n2H2APOjyksOVMOxU
uDE37IRVwnfbeUhs71HK83A3n+NvImik/SKC00UhSVYrQ7ToEdEhcHxDeoxqyW6OOUccWLy2
3oRIeLDeGr+B4cl+SYGkWiCPq3FcUG/g3aCm5Ulmp+SuzhVxnqnp911YGc/ypmkFOuXbsBNG
m77CyE2I5gsfsZaTVwfO0z2JMX2mwzPSrLeblWGm1vDdIm7WSHm7RdMssfihDi+V+na7O1Qp
b5Cv0zSYz5fosne632XQ/ffT24x+e3t//flP9SrV25enV6k8vINJC+hmL/CuxSe5Qb7+gP+a
T2u23FLC/x+FYVvNttFaGMvSSyDSh4CFoRpSItNv71JWl8ekFFpeP7+ox6zfXM53Lis7y8+5
tFIp3SpkmIz4YN2gQYKmtha8cb1mRqXb5DHDTlEZRO1QV2pfyWplHJw3O2Vu0h+VUpCVFnuq
CU3gXWT0EVD4wBhh+Dwx0w0pCNwtt9lw4aRa0FWtsrTP/ibn8a+/z96ffnz++yxOPsjFZaRP
7w8kbvqAHWoNs31pekr0wrb/ZI8UE1tnlGr1wDs93dZ6M3FukBUmL/d7X6oaRcDBk0ndcuDz
I/pl/ubMDcjAai4mdWbxzUmSrBv+7r+1yoSXyj3wnEbyH/QDd5YBCo9720+Sa1RdGa3ubQxO
R//LHsGLyrpvn0yAcY5iC6eM8MojfDI8p4wfYvStRLVmnedSATa927Za1tnK/HPsunKZ3Xb2
38CHrEEFQe5Q2iscYFK2i0pIIlzXaBpkoFGZWZ2yKjUvXeqEwe4w+9fX9y+yiG8feJbNvj29
S21s9L4zjzZVCDnEFFW0+8oBH6dnoyMK9LGsqaFNQFGyvoElyKqf3TY9/3x7//7PWQKPs2Lt
gTIilthvt+rrIFp++P7t5T9uuWbOJBiQ3gJq6BkARnpnXYn/+fTy8sfT81+z32Yvn//x9Iwp
x0jiU2ZfZunXcpNU4PH1Eg/3UcRUghPFjOcTSOAUrGCYkNbhlpblM8EFdQlXji2YQBL1Dg8j
69XP1vj8Pjp0x1H5NAVdR6Bvfut0T7mQLUWVhEHHYn1e+elYJ5bNVlL6GqYKyex93pN3F2eM
FGQv9Sn4gWcwgUIoGD0oN2M7IF0opC3mAlwWEmt3J5AMWPaRVnZuVglXeV/xWnhBKn4w8+RL
oDhQdUt1ppAh2fH/hvLcVIEmUhmHblKkkefGX5mt8XaqNN9WIxkFbuW0DILVwVFCJVj2VQIL
1od7TGvMWQ/qw5a0CW/RsE2LgtvjPCIONlNW6yUn2EYB1GlCDc9X48Tap8aqNsvJMb1aIDCe
i6tTqAb2hvVaHoXKAcyXEXv8QupAPgpv+FQ3eWr18EnvurTQ+HdOWuhOw+7MB6MfSCwL8l9r
AxpervCYhAFdcSdMycDBojOVyC6ea7QpuEKHguN+cZ0rumFWQLoTlUXikwiVfo9iwIVzf/K9
qph+VM+K3IhUFKnHisRIDKH1uI5feVHnxoeBqxpPdFJE6vTkiZ/fexIlyPZxz6qU/QLBu8zx
2sQJb6CEt2c1M3XJpVyLf32+YzMrPIlfipx5EjWT2pOiAHIydI9C2QIeu7EgAOvL16VdKXWJ
E9El+SpV6a9//AQFlEvp6vnLjBivBFiBYJ2g+qufDHosRIBN8lhKdpaUdbuIS+tE7i6aF/Fq
g+ekGAm2O3zf9UWTnMTqELNYfafSC+4L/e6/ZuTRicccUQnS5ILFORotZX4pd2YhzMt1E1nH
OPwkD0hLGtWQtoi22zkmzRkfR3VJEmeMoyU+tFHMYLt6vC+vUlphnpfljAq7WzS0J/phWRyl
kipbvdynkLB9WD6eo2jni8pK8O1l1Jk+uldxGtIW6jFnEO4geUbrjsm0pOz0QAU/IasiY+eH
AH171vhcP1CFjsvhRC4pRVF0G67MWAwTZQfrGBhGaqmjWuozOzM8tMH8TH5DitIyB7K84Rd1
oOGsOm8yLFrSLJXGta3KH/nWSdlsoVbBDZSs0eehbtRXTua8iMPtwxpfRBLZhEuJvbPNVMk8
ZfhMFUT4cRCjW5QMn/6CWjcPtG0ge87/ZWluF7s5si5J49tS3S3bLeZbuUfXOF7igKaPNhpU
pQWHN4rQ/oLkApHwZos/xmQjN3mrgh6ROnv8NLZmIACrtS8dZs3ujmEth9mydpk4iN+vURQn
jJ9srYs3+yh1L+CQL9P0I14kPFMhBf8aXy6ccfvxaxbvAjyio5tKRRHvPA+zy+J2eHCq1aYY
fC4b/IDnQu0Nq1WCwdMe90fhWpSVPHcsNeISt02+dyZz+u3Ztt/Iny0EGcW49mF8eKGPTiom
DWkvK9+bswPB4h6b0NdLZuHdhROszpx6Ur92NKSh/lXc0eS5lO3vDk5Da1zsAkRYeXyh5SHR
hdfiC+pw9YXXaD4PbHq3WzHcNFr5EphVFQ7nzgcdGEI+oauICA2omAh8AAF5lGetR84HdJXu
CT95HnrSkabbwPPC8IjHtxrg5Qm72Tb4dgW8/OPju4Cm1QHfUpfczmQwBABeEuxWAMgH2TNh
IjWcViycbUMB+4c/YAuwEDvXuZjoMBgAqFA73yfrI3ai241gtgShAHc+QoXiOmYZvnPMT2Op
91vMjFCI6bo3jo5A5qJqTq1OgHXf490thWGGpqg1y0SkvBweuhXEs7cvNKMpxuetUtOEEu9y
qInK8ovjUlC7fEjzptBEmGY2Ey489I/XhEw2/GMShKgLhPmlUsvSwtY/Op5Yk2uMj1pHcMkX
qzkumPbMqIYE4qpGrxGhhSmYqOfpN/XczuUrBGb+bZpO5n9m798l9efZ+5eeCkndcrmTSBBj
ltqAxSluJ4JO9ZGLuLGIJx4/HquSM2srx9+ou2T/8fPdextNi8p8WVL9dPIwaFiWgQtaF/48
tk3hIJMQHj6q8frRx6Pjh69xjMBjXUcnqfIQufPy9O2TnYfD/rqEx/5s9zMbA6Gn6DMPDhmX
52patM3v8Az9bZrr75v11iZ5KK9WMgMNTc8oUF/LGJPjczHXHxzTa1TqqNNRTetg8lSpVqsQ
Pyhtou32V4gwQ9BIIo4R3oyPIph7jmuLZnOXJgw8+uNAk3TJvOr1Fs8MOlDmx6PHBXAg8Xo8
WxRqhXuSXA6EIibrZYBreybRdhncmQq9J+70jW0XIe5BZtEs7tBIPrdZrHZ3iDxseySo6iD0
WBR6miK9CN9Tez0NJJQDM8id6jp18A6RKC/kQnAr70h1Ku4uEvqRr8M781FKDobbAse5Z2Er
ylN8cJ7rmVI24m6bYlJJdfJOo3xpXwy+5uWMkqXBkyWGpNFDWlIQSGyPIBYWexjhCXZLNKDj
MqoJUtw+C7Hq97VtdrIQLfrEzUhyonInM/v14gGrBEg8Z+RAw2mSXiCrZ400TbAkxktW3iK3
yr2Quqb29e2AY2SvrIY32wUXvGUdIa1SKHiiDy2cQ7Ytj+wxduxCkwfPozwD0eMhLQ4nXCkd
iJIIO2PGCSIsjc3bgrEJpzqCUKOswVYel4JjgPYPzubT7VXRVOZL3Ra4zTK0VIUDQelWuRVX
ZJaLJILUdUzwTY2vpYxTssbNA3rrqpzr6BttGg08SMsyxh3xCARHhwpSw5g3riaeJHyzXa59
yM12s7HumV0stgAsoloKYYHtP2rhQTFtmWkmQ9GtWGw8JCd5ptMmprWvodEpDObB4k5LFVW4
wysB8zg8xU7jYrsIth6i6zYWjATL+S38Pgi8eCF45YQGIAR6MNGudhSOUdhLuLxb2dI/dT2B
3hJocxKymy8wz26XyPRZt3DXglS2ndREHwir+IGiTqcmXZqa2rGF2ZOcNL7yNRaiASiaLN6i
beLFfO6Z2vEqDEHuyzIxnxu0eiiPqLTytY/mVC5aTCUyqfiaXzfrwFfI/lQ83h3Ao8jCIPTy
gtSnxNtE2H2aSXEhcClx2c7n3tZqErko71YnxeEg2KJWDosslufNfO6rjzEeBPeWsGRSGeHw
MtsSn0amfuA4ypr1KW8F9+wzWqSNmRTFKve4CTxbR4rfKmuQZ90n8FjUqpl7WL/6f033B+Eb
GPV/KT3dGRoBKQoWi1XTdRAt6xRHkmti1wRWj3oujy2LRGw3TXOLN17YbtPc2yvKGl6yquRO
pLW9ZILFZnvvQIGibrMXZT4nxQPq3uYSLtitYqjA1YNJg5To9UukE77gpUxYDLMb4Nr+pKm1
gvxClyXv6y2k/lZC1DvJ218tc18KM9jNRT9AhhTPRlTjl3t2okKG3pNQGV2vcKlN73MuPVEQ
R7dcTaJaPPSKSfxayYRff2W01P+pCIOFh0XwWJ2MngGR6HA+b25IGJrCwzE1cuXlPgq9uccx
YuI9O2vWopmLrJOT5qmpTtg4fovbcBGEC+wZHZuIZcIjmfNTnUldz4nKsiia7XrlG76Kr1fz
jUeqeEzFOgwXvrY/+jRca/zKA+uEZs8CoR+55YrTmSqofQ5oqFQmgqXftqv1ADmbzjmqsZEU
ulfzaaHpopnLJgqfrao3WzebzXq3kNJkJSh21TXQbXfhqi0L7WDsFqMPhba61PerZGS79BhZ
NYUyVUZS9MOfXx5pkhSedKndIVG4M7WMMf1QUpVsTqShi5L94hUkdFfoaRePjXjAFL7+6uCS
1oyI1C32mjqXYBocs2C+c4HgwZsTAT5eajZcvFrXYbAdh3naTHHJ1/PlXHff29wTel9SkZzB
y+RG6TY+zlbz9UJOMzshuO1qs5w2qLowZC4Rotstro/b+Qqahq4/NeN1KUh9BQctWBTekrTK
5VvJgF0vNNY/27GZ5aHfxE2+WE52fAd2uaWN9PkxaSrK5JzEJ29rJKsJ1zsyLT5mZDFHJcuu
r/U5XMtTSq+2yVWZQq9Xt9EbA+1UX0OYqVTIUabQUdaMunq4AjnDpWC4Yq9RLHIKyOaLKcQ9
shU8TLpwX5c+CCaQ0IUs5pNmZqjSr1HmidVBVv0d2uHp9ZPK30l/K2duQKfdbvUT/razYmhw
RWp9vWVBcxpVPHShNbm4oM4bGiGWIIhrmXxQxxg1qbAK9S2UghtX4in+AgzYUN2cxz2sLfhq
hd8/DSQ5HpKODfQYhY3cMuuL8y9Pr0/P8NzkJGWDsANszphGcypos5OcW9jOazqOX4GRj3L1
yDjE/kEC2H6h8M+vX59epoGE2lKj07vEJvfuENvQzrUwAOU5+r+Ufdly5DiS4K/E01i37fYW
72PG+oFBMiKY4pUEI4LKF5o6M6pKNkopV1LOVO3XLxzggcNB1TxkSnJ34nQ4HIAfbZendPfK
hDiFCJ0d+L6VjJeEglRnZoHsAO8PWIxikSjlnhmGBlWJqXDDE55IUrFjKhaTVKSqO2YfSv7p
YdjuXEMu8oUErSgf+rzODA+qImFC2pwO7sVokCp1HrORltrWO1E0mAZoCsu1VQ0EJzV5rtYv
z/+AciiEsRlzvUeiV0xFUcXQtdE9RiIYtHmGoSiLXmeAGWHkkIVgmUFboZA3FAFoLJMUh+KS
I0PKEfN35m6SNK2HVi+XgYVqtfJTOygIfjczkezTKnAHfQQn+Ebhkyz/1CfHjzhvIlXJZKLi
MARDoAuRydS0JeOUJkMtXSb4eDQT+clohf6lT4ExYAPQGeNAyrFsDY1ckVgtKHVRQ8Kk7UFL
wRKaxeAujkVKJXmHsKZKYmRUkG1fbJffDSwhGKUNQf0i7buSbbxaYTUPS5EpVjn1eMpK1GB4
PBLRWQcCYymbH4syzZNCYio4RxPpRHS6zAG8tQaCtdL+jG00LDw5dIzWr7ogrY3p78HTukYz
wjCEWGfZ6qPetpLp0+Tbp5EVbVVQRbjOSuk0ClAQtLND96ogM0zCoieCFy+mogMJN67m7/lw
IaKULZpJcgApDgroCsklM9HMgVcOB9bmIFPvNyo8Xam2WGeyiewCHGGzpFpcheaLXcmWSBka
JqWzWS8GZVPEjK+I0rVywn2dMhsqg0oAKQ4g96OHn4FWtCeHmko7x8MNUop2NpRGFUtjo9cS
6PjiQ0QRd1JsPAgaqq4KyNDB4BDX2/EDgdNT+q81xK8q75U1NMOUgMBrWiy9B0ur+Gx3Z9Kz
GCpLrgRuB+ikiG2m+IhK/xiZUQ/EfpSWhJMiYYxF5CmRMy0BsDoPc93Vz6f3xx9Ptz9os6Ed
LOotorjAZ0m350cRlpk1r4+o/RAvXxGdK5TXLZULiLJPPdfCYmnNFG2axL5nYx9z1B9bHxc1
yD3s4y7HIk4ANss/+LQqh7QtM5QbNgdWrGXKYQHnFXm8iJwVgc1AeWz2Ra8DW5ZmauGm5bAG
uQLW2Vy57c+399v33b8gk8AUWPpv31/e3p/+3N2+/+v27dvt2+6XieofVLWFiNN/l3hzTGEl
6JOc5ZAoiGUOkfVJBcmSbRqxeqpCIMir/OLIIL0BjEF5wqCi/sRCmMoERXVU55LHyzVwQcNM
EuUy6HAb2kiKqpdD3gGUa3LaqSH/g0qLZ6qEUJpf6HTT6Xj49vCDiRDNHBhGqGjA2P6sigYt
0icAu2bf9Ifzly9jI+9vFNcnDaF7aKW2sy/qe0MuQUBfCgizOpkjsx40779z/p6aL3CU6Opu
5Em5etKfTVXP/CLTA3AKp4dvPYytINKM0b12JYF19AHJXvVaEvqnrW1XmKUUUkpTyJpPYd7B
rihYsZABMzFTgB3AIZ9PMWP53Udb7KqHN+CrNTCVbnHOYp+xE41cEjjMwU8q8Qsx6gzAqDTa
J2J8bwY896AJlfcyeHVpVzo2r3v85ABRielpEM4M+GUmUCiaOoXQdU5/iokoAFpWoTWWZStD
+bFkrwPl+IYwqn0YOLbahYYvHUPbwLVV9ZYGOD3FRgUJLOzNj+Hn47VY/yC+cABkmPx8RdDs
HinAvtzXn6t2PH5GWCup9Ei0jGeEPUwPZQitWRUJoG+ndMsTsymsRf8pzhpsQpbQMEo8Zomq
L/PAGdALEyhZ3kwWENOvMTgPwgAnkr5rSpFC9C4/EfkPSQXjt8+kUMKfreCnR4iruQ4BFADa
mHhMkvRL+ueG41/dt0ChzRPAprr0OYIiqbYPHu537KwhVT6j2IUpitFDSK+4acUtjfgNgrc9
vL+8ahpH27e0iS9f/xNpIO2V7UcRBLRi1uait9bkCQtOQHXeX5vuDpxj2aTSA3gFCT9Et62H
b99YBiC6n7La3v6PqR4IzBo5rSs8dugEqZSHQ+/D8uWiH06AOTPWhBhZRnZBgaBwvm50elAq
D2f6mXybDCXR3/AqOEI4K8FGNdWNHeCnVrEnO0euA+CQKdklViQfQDSsJBhVrMTVE47Q2TLc
DS0kg+2jpokLQV8dBqxw/ga7WThywatQsMdSvVNNmpdiQDjge2mvmAAskD2LXsYj3fu2M1M0
B2V/mj8pus/qxsDnT/VMEr5b4m+KsIkhFChz77HWsx7PB/D94ccPqt+zKjQ1k30XesOg5FXj
OW5m5WB9NWLHQWPCB25vcE3avfbRoYcfFhpFUewSomdzdKcP6Xgqr5kCKptjkV60kdlHARFt
XTg0r78oJqt8xJMq8TOHskSzP6NcxsmKBuPeedJS2fKAga9pFruoFQtD63EO+DxA6MgUD3+6
McnL8Y9Bb3/8oJJVn/zJX1CvlMONcdInohrzteAzdqVzqU4PZ1ELgzra9HConDaBv43CBYCr
D9QEV9ssk4AJhv5p3xapE6kGioK+rwwiX2GH7C8MrmNpte2z0I6cyNTIfRb7oV1dL9qH3C7D
9F3ZurHnqiuijUI/8NUhZCJUK79L/d5HDVenUQKjsShQCmPgKFAnkIFj0R6Agz9Xg14EN8nR
GmQ2/OULqori2BN3bmROFoVVmyu5LioH7QD365sZ0rVjNK6LwNy2ysap60aRyvJtQRrSKcCh
A98QdQKXHJHrW4beF+5ETY/yH/RxPdOjnI6UIDP08djlx0S6ZZkamd6dhWMWy9zJarf/8d+P
0zWAdk642tNZdsyI48WW+L2IETMUiBj7Kt1prCijq+9KQo4FOgRIe8V+kKeH/5Kv2GmR0/ED
gkwgzLEQEOnyegFDD2VDVhmFyQmJQjTAlT8NjKU62CIXKaKNJrmGiD4SDe4iLNPgDssyzUfd
98WHcxEhZeSSEbapa1FuYZZJMokdiqtRZoxFn4S3ozG5CKobC6iVtuKpjBFB3h/prVUAz0lk
cWVXoDNyvEoEv/b4Y6xIWvapE4teVyJyKgJHLrqPESc+rAkvVQzV5SzqfNVk+OkBUsRUJiqp
RkgGL95JiVA9YLaENeXTabOEE4pfzma/DIE/sUISZg09IeGSAMJhg65gBcLusU/gWu1+TK+O
Zfs6HBhZtDMQ4ZEJjpTP4JKx2Ywhe8zgam4wxa6FzUG9JeBczv6zEw6icYaCkA+fKvKUfTYj
s34801mhIzwFSVE7Bw6GFtY5XZXSSMBBLKRayV8hwpQyicSxJa1zHsXZXhh/nZ2ICtJCHRuT
wZhQVB1mBKh/TqjD5ePUWgybRqSY3g18W4fzePssdtJge4EfYH2cDeg32k/n07P9Qa+AIeRY
jCLK8TEXD5EidH20VD/CSyXV3vXCzemYbMxxonnSj8n5mHMx6mEuhjNd1/uW62It6frY8/Gw
JzPJOSW2hd4oLz3N4jgWTWqZbFP+pGphpoKmhxR+X8Gt3ngyCyRS0pJ5Kgtd1BdSIPBsyQBe
wmBb/UpQgae4cHsrIXwTIjAhYrwZFOVi8yVS2GGIlho7noUh+nCw8VRdFOWilyIihWf+2LO3
20opAgdvkmfIHsZQ/lapxDV8SlJ4Ltn6dIAMkDVyFb8UAUagCLwfWhurk5l/QIhlgx3aREUC
Q+CklcLebvrkEpFkKdaMAz3QW/5hswqgiZwD+qq3kPhu6BOshiNBk75P2Nm5iDdP/bT07YhU
aKml71gEO7UsFFTJSNBP6Vxvfcdf5mu9OafiFNguykHFvkpy/HFXIGnRmHsLQR8hq/NT6iHr
gCplne04aFtYupijyb5xomHiHZfRMk1odElX6QyvniJVjDe4T+keusXDQOHYiKhkCMcxlep8
3EXPCbbEGKdApDdzwrfRpQ2owAq2RBEjsWO82CCIcESM8Ae73AkdhEc4BudXSCG4LTYYhYvu
NQxlCNst0fhbI8sozD3CWaVKW9cyBPFaMk+mgb+9l6eywfU001XgYtAQ2RkpFKfFWLTCNl0K
RSa5rCJ8hVTo3aaARivG5ElZxWiHYoSDKNTFm0NP2KgnlEThIcuGI3ys1DaNQndzMQKF5yCd
qvuU32IVpJdNsCd82tNFhUwZIEJs1iiCHkaRManbtAox/mE39LEkENpKscRRP7lW006jDQY5
9faWAKF4TKekYPcPQ3npppZQ5VRWIEOb0x1autsVEI5tQARw9EdaV5HUC6sNTIyKco7duzF2
ZlqI+p6EPlp2FQSomp3aTpRFdoTVyeJHObgTmkQTbkujhI5G9IHEKurEsTD/Y5FgGLBmUozr
bAryPg09vfP9qUqx7Lx91doY2zM4MtkMjg4gxXiGOLkiyXbbq9a3URF06W1n8whxjdwwdI/Y
t4CKbJNj10oT22iiSJHCQVR+hkAbzTDbGgklKcPIRwM4yDRBbepc4ISnw/b3lCQ/CZYaTHgm
kvXwBIJsuH0BQd3QmBITUV7l9NReg7fjdEXKU6GNFfmnpZep3VNqFA3WgRkJ6cYgfNwIefOI
1gtaNbesPTaQGTZvx2tBcqxvIuEhKToqJk32fdgnLKq5OWnd/Im5dIRQbC+CBivGUTZlFNFr
i3R8XkEAgkK8RJlRshEFt7nBeGL2N8GYC0L+NIQUe8VbDTXT3adVIpILYOnOE8h4MtkGP4Qw
Cu5KAVGqcOMakQhySYxphXOfRGh6mOBEqgXc6qbw68/nr2DgNXsa60lBD5mWGA5gSdpH9FCG
xUlgaOKG8oFjhjrYebaFuPvrQ774SdI7UWjhbWDxSMCINW2w0/VKcypT+UoBUHRs/NhCHR4Z
GjMQYEUOrWMNxqMmkFTgi4KNDesouy8XtLIFKD4FQTHTdYhkGCbAldgECwbTxWZk4GCfBPjV
+IQ2JY5g6LLGJhRQx6TPwcKQXavIHYCbFOmxQgCqhtoiShlzkaJ1AjFuJMBOBT352Wx4hYvX
Hoz7SZG6MowWLZnSQAE8TrHamLu80jxUBHQUtRWe+2zF+mqZDBxYuLcX56jB9vwQvw6fCMLQ
dAG3EmxMJSeIMIehFS0rCws88rAz34SOYitUppo/5yFFRXG82UeKx/Vchu8D1xDtfEZvlZ7X
B8feVxiL5V8GLY4VE40ANPRccu2QvuryHouiAqj5qUqQDnOwG+VWdIEbDBsnqx7FZ4hVP7+G
iDBulKQA7yJZX2bA2u8D9BUBsCRPUVlNCi8MBs1nRKSofPEctoDmVzS5uLv7iK4H/F6Hf0pw
8ZzsB38aFfPHVJc3NlN5eQeYFF5Ruh0G7GIxJtUBb4aRaRR78Ko4y8Xo1mTwRGZbPi40uBmZ
KRrgFJjMVP1qgia1mcNjk2ybn+y0zwrWW9dYXSEY0OkVOkZmE2zi9M9iPJv4itZ2whm+sc0s
JNqeTDFU6rtyyNRr6VmuzmwrmoXIwtbLtbSd0N1aL2Xl+q7GVn3q+lFsHOnZLFBmxSY91ckx
wQ0rmMrTFV+aOtnUeWYaUwwp1qsq8gyZyia0a29rVhPJB5W4EH7EOImLQaMo1VggPTAZHTR2
mnFU5zJx4vq5owlM0oMGgp3/J1lzUBShyYJ5Bc4BrBZGER1iTSr88vEczE1s1xrhzewes9Ic
igGCxjRln6AOyisluNWfeSAJcq5yQ51L/vSF7oMGUPXoSNf5ZtVwIonEuzMBlfluHKEYfrxA
UfMRRsMg86wg0UOFSLMeLfQJUU4HMsZ3DNPIdPsPhpESOYYdQSHC78IEjkhq3/XRk8ZKpG7c
QlhBpplvfsxJLr6LTk5Byti10MmmqMAJ7QTDUZkZ4GMLm3Ro461luI/GltkA4VuxTGSwNlGI
gg+puKTfHEOgCcIA7xWcKPwIT68jUUWBt10NownQeVq1f0PZ9BTwYdmSiaSEmg8kOC4S7VIE
3HSYVKL9SfgwwoulqCg2LMEqbW2qHmHHYYGo9T3bNCNtFPkfDDUlkfUdEfc5jB1M6RFo6BHI
NrC57vGlkyhHIBGjm9jpRIfzl9y2UE5pL1FkBZahdECi4QQUmhgv+1phYGYrPPmnIpUifhoY
FZyRNhsGugFWvXoMWzHEqdrEQvceQBHTDBK/isIAP+EKVOUR8sV+tA8QesKyAuwSS6KJHM/A
j1Qj9u0ADb8sEQWOa5p3fuAwpOVSycKPpO98rPmwQb7tGtb4plWiSoY6oSlExtU8nzQ+KmI+
dOiqmOxCuyIEf54Zl5oOGul6nBcgddNDUk7ZQhsycDIs2Hc3qO07p5nw+scTgqqbJR60aybb
Z92FRXcheZmnUNLkjPnt8WFWg9///CGGxpyal1QQXG5tgYTlabjG/mIigKhoPYS5N1J0CaQi
NiBJ1plQs0emCc+s28WBW1wTtS4LQ/H15RVJUXkpspylS1YroX+AwaAUOiy77PVjh144q/Ty
+O324pWPzz//mJOAqrVevFLYy1eYbJ0uwGGyczrZ8p0wJ0iyizGEB6fgB5eqqFkS2PooBp1h
xVd55YCvgxxcDTCHMiEnSEg1pvQ39bvDtW4yaVCwzktTsQQJWYdGXTzL+MOwG/lfIOvyz2fg
DD48PDLA0+3h7QZfMpb4/eGdefLfmP//N7013e3//ry9ve8SfqLOhzbviiqvKZ+L4WaMvWBE
2eNvj+8PT7v+gvUOeKiq0HtSQPGc5iJtMtC5TVpIPvxPO5ALmrM0s0nFn9AYGQs0RXLm9z+W
DSHgtmwkP5c5dhKeOo90TxQ4uq02nyjI84AIw1XsMmEx99TExPvzwVFk8ApH1hODU55uxNfm
FZNVnIOKI1pelZRlgy/Fvj1Kq2AVWkiOXv6d2Y19WsGzJbLyXYVmmOU43YFbhEMrP/h0vPSp
3JFFCiz9kFuzCAkWjrBM5IA7wD/qUGCPzlT6IyPGGalKfyGUGXaw7qd4VbLxf0VGwrLcd1ha
YOgE2yIMPbgUVaqPGIU62LvpjIXw9Smy24i+7xz08Pz18enp4fVP5AGZb619n7CUEeyj5Oe3
xxe6a319Ae/X/7378fry9fb2BnFOIDLJ98c/pCJ4e/pLcs7kC4UJkSWh5+Ln84Uijjzs+LDg
7TgWYxdM8Bwy0PracmBw2aB54hTSurgn9bQeiOtakVpcSnzX8zFo6ToJ0uHy4jpWUqSOi+0S
nOhM++R6jv41Vf9C1PVgRbuxxkCtE5Kq1UaINPX9uO8PI8ctnPLXZpgxQ5eRhVCdc5IkwRw4
YSpZIl/VDmMRVEkAtwG14RzsYmAvQqQLIALUO2zFR56m20xg0ItV1L6PbG2cKVB271rAAXZs
4dg7YtmipenEi2UU0DYHGoIOamjbCPdyhFnyshun0NMGbYZPvVS59dL6tiGOqUCB2l8v+NCy
tLHtr04kJi6aoTH30VMrAbh5DAFta1xyaQeXey4InAYM/CDxN8K2oa2Lk3Rw/GiKvyBqjSg/
356XsrFpcvAjqEARmdc4Y/4QXxOhJogA7HrIkDIE6nG44n35rkJCAL9sfBy7UbxHPr6LInuT
nU4kctTrDWm8l7EVxvvxO5VR/3X7fnt+30FsTmTgz20WePS0jd2JiBSRq0+xXvy6E/7CSb6+
UBoqJOEtx9ACkIeh75zwkInbhfEIHVm3e//5TPV3rQbQT6jm7dihj5aufsq3/8e3rze68z/f
Xn6+7X6/Pf0QilZnJXSxhVn5Tog+KXM0cjAkkL+qLTLLkZQTc1N4Nx++314faAXPdBvSc2dM
zNX2RQ3H8VKt9FT4fqACi4qOlyaCGDTWewpwQ6qQlSA07zGAjrVVS6GuvpEA1Pf1NjQXJ9jQ
hADta4UBVN9CGRSvItyswg88pDAK1UQPg2obWHMBdx2sYj8ItyvWpRtAY7QXoYP6eS3o0NEk
PIWifQsDXdpCCR7ai4jqABtc0lzi7SmMAx+pzXYjX1M9LyQIHI2Bqz6uLPH+WQC72j4MYNvG
qFvFHmJB9BaaEXbF2zZWzcVCq7ngjbogjSKd5Vpt6iLjXjdNbdkMaW6aXzUlcs7tPvlebe4R
8e+CJNHaAlBEIFK4l6dHsx5GCfx9ckC+rIqkxZ10OUHeR/ndlgQifhq6lYtuALgAZbK1pDDs
HmTeyv3IYJg4b+mhu3Ekya5xKDu0L/DICsdLWqHtlRrFWnV4enj73Sj6M3i+05RbMLMJtOUE
D8leIG4/ctlLOKytLfFI7CCQ9jDtC+GMDbhkvRqYSkqHzIkii0f97S76aV36TLlUPtdrxPz0
59v7y/fH/3eDWy62z2uHeEYP4bhb0Q5exMFBWs7upGAjaQPTkKLOrJcb2kZsHIn+gxIyT/ww
MH3JkIYvK1JIQlDC9Y41GBoLuMDQS4ZzjTgnCIw4W5alIvZzb+NRH0WiIXUsJ8KLH1Jfypou
4zwjrhpK+qFPtrCh/pjBsannkcgyDQZooqI1j84OtqEzh9SybONYMSxqsq4SGVo2Ve7g2Nw8
WIeUan+mgYyijgT0U+RZbKr2nMSWwUdNXp6OjcZrEYmKPrZdA/t2VFabpmwoXcvuDjj2c2Vn
Nh04zzA0DL+3eLLhdVdB5I4okN5u7FL08Pry/E4/WQJCM9u3t3d6GH94/bb729vDO1X+H99v
f9/9KpBOzYArWtLvrSgWdNsJGEgGCRx4sWJLck1dwAbzqQkf2LaF5cxY0bZaKiwS1FyMIaMo
Iy53ZsR6/ZUFdf5fOyrc6WHvHbIvyf2X30S6Acs/BKhZwKZOlimDUUzrUG51HUVeiC2jFbs0
moL+Qf7KFKWD49m2MhsMKGY3ZjX0rrgCAfSlpBPpBhhQnXT/ZCvXt/P8OqhJ9swpFsYpjs5T
jA8wntLqhF3PQv3l51mxpFCg8zdSmAcAXnJiD7EySvNiz2yt5RzFB9zFWuWg5pb800RfM7yk
AAOG2Hzqo0/5bMCvdVilhO5e2BbHGJu4lj62EJA4sbErv3VsQ1tk0n73t7+2kkhL9Y0NSQBo
0/DR/juh3loOxl8xFqZFjWmmpa2s25IenCNN2vBeG25j2WPs0Acm26Bp4aGxcefF5voKD2bF
HiZHzIsrglMNHAJYbfcEx882E0GMp9cSuh3JlSWHWNrlAZan6HbgBhoXU73bsTp9Gincsw0W
zUDR9aUToWfMFauItgkIV3SIcFZ69SWz6SYND+BNhrZOtqNbmD+dtpMNtgchExlXIR9kx9ak
FUBdTHCG8+JLekKrr19e33/fJfSU+fj14fmXu5fX28Pzrl9X5C8p2++y/mLcQij/OpYYrBSA
TeeDB746GgC2jUtqn9KTnyrGy2PWuzz+u1TUBMeNdgUC1J6O4+lMqowHS95SdpfkHPmOg8FG
Oi5quybMxSu3BYts8M2jmpNsWyKKZcTqtNP1GGmbDpPIjrU8e7MqZM3g3/5H9fYpWMQro8G0
D89dYvTP1htCgbuX56c/J23zl7Ys5VKl2991s6RdohuGvoWvyFhfWSRPZ6uZ+XJg9+vLK9eJ
5GqpDHfj4f6TwnH1/iQG3ltgscaD9b5FjeoXpKN+ArbynoXdvCxYdWI5UFnOcK7XtIjySKJj
aSqcYQdloSb9nqq8rqqrZEkQ+Jo+XgyOb/mYOcSkOndUZ9A3WpD6qJ0yIE9NdyZuorSKpE3v
5DLwlJc5y9zEheTL9+8vz7uCMunrrw9fb7u/5bVvOY79d9FmCrkhm6WyFWOG31yZkK6ITMci
Vmj/8vL0BglcKKvdnl5+7J5v/21aO9m5qu7HA2LZp1tzsMKPrw8/fn/8iuTEycRUEvQP9jwz
ZvsCgxIFmrVUSg16VkWGY/ExqwqDkrw8gM2LjLuryJT+D/uG1lWRfuybtimb4/3Y5QfpNhco
D8zgcAlAgctNSgcJJ0d6vM3GQ9FVaq4tuYPS8z/AjpAqCeJFIE2FLphw8B05gTEShr0oA0XS
U77klQN/uOnhc0cFEH4xCV/xHJdU3Qrk0nguvtIOPB0O2cTgGi6Ohg2kL719bzWIawVdJaVb
nZ85BbA8JZejIa4hQ9JxNczQOStVLujSpINMcqeswiIFLiTlJSPKJPDUvMf2LMPbpM7LdU96
+/H08OeufXi+PckCYSYdEygs7whlQ0OWH4GWnMn4xbIob1d+6481VdP9GH9FWr/aN/l4KsDF
xgljLH6QTNpfbMu+nquxLgOkb/NYIBXxO+MPWpOXRZaMd5nr9zYuoBfSQ14MRT3e0faMReXs
E8vBK6aE9xCF5nBPd27HywonSFxru6sF5HS/oz9i1zEUu5AUcRTZuLeqQF3XTQlpT60w/pIm
H1B/yoqx7Glzq9zyjUexhfyuqI9ZQVoIYHSXWXGYWXh6DWGe8iSD5pf9Ha3h5NpecN0cEeED
2qJTRg8BsWGik4qc6XiXWWyhb5RCoZRqT8+Ln01zBwRHzw+3WaEGf4Qyooe7Uym+9wkUzSWB
1rM1ISn0GAk9EqLM3ZRFlQ9jmWbwa32m/Nfg7W66gkDE7tPY9BAJJEZ1/pWcZPCPsnLv+FE4
+m5vWEX0/4Q0kKv7chls62C5Xo0feZdPuoS0+7zr7iHhX3NOTyTt8rzGy++S+6ygy7urgtCO
UU0SowVjG2zEIEcjG4ZPJ8sPa0u7/xIo630zdnvK9Bl+MtYYjASZHWSG8lai3D0l6AEPow3c
T9YgPkgYqCq0uwJJFCXWSP/0fCc/WPaHjYyS5INe58VdM3ru9XKwj4biqP7UjuVnykedTQb0
fV2jJpYbXsLsamzjTOa5vV3mhucHUc73dC6LgZ7vw/CjJoi0UXxBxxTMS5N08BwvuWsNbZxo
/MBP7tCM5gtp34Ktr+VEPeVLVFZMFJ5b9XliGBRG0x5t01PAStidy/tpKw7H6+fhuC0JLgWh
CmczwKKK5WvlhYaKnTanXDO0reX7qRNKhwNFrRA/33dFdsyxIheMpJmsR5n96+O3326Kksiy
73JdXup5eqKT2tNSQYM07uLzhkVBtZJPmqnWVJEYZ+tz8QCRHxMIlg8BNLN2ACfeYz7uI9+6
uOPhqrYF9M62r10PDdTKB6BLsnxsSRRItwgyylPWO1WC6b+CfqPJHwqOLYMb+IzHo9FyLKhJ
6FT1p6KG7Edp4NLRsS1HUcL7hpyKfTLZ4qoquoINN7GRgqU7x6H11I2Tgkkd+JQFokD/oM1s
h0gZVQDDHezokk/qIZBM3lVsGA2DAZtpcoBlbOcmpQb3HRNLK+UY81kCNu/r5FIoYmoCYvEH
WaO7tD1ioZ7YWa6ynbMrBryDhMeAOQ2R64fS7e2MApXTQX3mRQpXDGcsIjw5+suMqgoqFN3P
mM/mTNLlbSIdOGcEFd++yAICPHR9dWXDCr5XxnDgXp/gz0rP8wSTUVSnApc05sz1+Vx0dwoV
ZP7skjprlgTdh9eH77fdv37++ivk5VZNfg57esTOSp57exmOwx7lH7QoVsn+4et/Pj3+9vv7
7t92VDOcHTHXC5KlaNAbmSMhuBoWqEsUpGwui+OplwjF9q0UUybPzVKWAEEappVTuq0IHnsE
lV4yEfoGtJKs8d00FHO6v5ay19eKnoJAbpZOaaJIdhlXkIa3OWEEzOEKhKLU4DDS2AaunLJB
QWLXeQJJG/liJp4VIwTR0hukRdUUOAKPAidUeaHjGopp2lfcPgtsC6+yS4e0rjHUFJUIHZ5p
eqcF9MEymb9nVnGQbmy63BLWOFzDiCVqd5EzIWnOtRjnGP4cwftTDbIlY8a2y+mqK9AkHVKB
dTYqab8B1KaVBhjzMtOBRZ7Goh0uwLMqoTodbPBaOadrlrcyiOSfV9kgwLvkWhVZIQM/JSwH
uAKhW1177mWvZ8KHAy4+ZWBVDHkHKGn4pu5QMLrUZjwbKyPFX3DmZT2eAgM0ZTYmeOYOqI4e
OEcxjTMALxCCkeQMedB6sGKLusdsY1gj1TR2C3D+fnMEhu5cb0TZArK0p8p/Atdf6o2z2Fae
U1PjhTN42Opgfr+vNnuhVydO+RgYacwvdM/VC9aZLEnp+Wb1FhWHSXeHZbviKfsH81YR73UX
mMT/kA2wy5lXMtWPv+T/DDypQXJgAM6vralrZ7KXWw4u2rNbKQaGUGVYdASpQqA+JzZ63p3x
aVIkn/VKGJivRh0ZHApFZk2IU3FIUBUCCPZp5kgvr/NXoO0EOrhtMhR4QsB9U+dyeIoZc0m6
IhkQCZEW2KGXTZ3oZz4BOCvtz0THzMnLN4QlK6ACflRF5oRIv1DtJXTsuBpiULGposK8knHS
rgefFISGB5VG218Vd13DxE2v8NQ+rQKXxTAm4/VUkB7hpCwnxbGGtyQg0x+TX9LJsxaekA+v
t9vb14en2y5tz4td5PQSuZJOEQuQT/591Yfn5h8IvCV0SMcAQ5ICR1SfkQljZZ3pxj0YSiOG
0kibFQdNck3InDbCvFHM7SnSQ1Ga+Y6XhHe0qAbW7LPk0Lw59GIRML2nInBsiECpjMqnL17o
WbwWR9uMeOXmXYKxV3837vv0QgwZISYy0hzgkbOkErzUuaivHr++vtyebl/fX1+eQYuiINfZ
Qdx67tgqHmDmAfjrX+ntmQIvKDyNE3G5C1ESWPJGfYImuplLVGx/aI+JPvZ80OnaXjaN6XhG
dy09aoEkjpSbqAWXJefx3BclOpOAtfE7UJlksPGibclrQcXIfpEaVgpPK2JlR2oJY9uRGUMV
0Q2kEol+wd95NuozLxIoKW1WjOdjtrgCge97hk8DG01BJRB42Cjc+W4UoHDfx1tZpn5gCE82
0+wzJwrQTOALRT+StNHrTYnrl3IkMhm1VSin8Eyl+iYE0v+UeE6JDRhD+AiXTggTX3A0mthQ
ojC1RUpoJiACtFeeE1oGuKHpoWF5TTh0cQFuGJAVNCGMJbq2izdPusST4DEGh2ghWEEDPfU7
yBY8bUYG4QZYx9/jWv1MEE6fb0wkU7eQ6eJqGAKXkjXMUDj+m1qak9DG+JzCHWwEcxK5NsJZ
AHeQ+eNwfPomHMoQx74KLKR+sAYYuzvXwpZalVDF1IqQZjAMVVkTA8q3UGHIcAGai0ykiKVM
dVKV2GLjGCXtoVSjIRHsTEOqKLYDiHQ9Xez/ZfIpBt9Gh+ixwA4iZOQBEUYI000IfI4ZMkYW
0ITY/ApnDUAqgR8VlCF6uUplKt1VIqkqqI9LZ1TG0unwImw4Y4wDwrGmUn3b+cOIMJbJkGiR
dImh67kr6W5sY6MD5z3UX0QkcBHG4gdFHU6OfelrZ3GGKY5VkhHkmDpjIGBnlaAE7JEwof/P
QTg1iu4wqdEGmWnQnQmpHCmqtogILFQTmVCmjLoKFTqNFOn5ASKASJ+42NYFcB9lcALPkmgQ
45miT4jj+2hXGArPtyxQhCFaM0UZYsuKFKGNdIchHIRLKIIqqsjexkKeYdtnf0jiKMQQa8yw
TSQ+QyIButgWAtceULm2EqBppWWqLB1sDxsP4iaOE2p3YhzHFa2t0oHER4aTxUrDdAiWicH1
sfquVeQbLEBEkg8OB4wEt9cTSaIPKwrxBJMCASYLWbA3RKAxeGjoNuW8D1uDZ1MWCRA2ZJHp
kGlncERZAniEHEsoPMK1IY75YPubiJCb5QkbW1sHL0aA8RKFB3jv4gDvRRwaygnxuYwjRHZ/
KV01sPqCYrctcdA6hgTZgkoXopHpF4o+cH10U2WYrYM8JQiwcanBd8lD2w2oCA14IFE4yKhy
BMocfZsE9CyWKGMx+11IF0VSsXxDTpMuW66DcLSM4Dv0sUvak4IVLsH5a0mR6U4XFCj2gv45
7tmN2T3dBbu8PvYnZIAoWZdIllJnKB2bfSgRsTPgd4g/bl/Bjwq+1S7P4MPEA9NPtYFJmp6Z
GaqxwiTtzrgBAsO2JjPyBVtggcMZloivCgxyhoclbRDz8q7AHuE4sm/a8XCQC9oXx31ea+D0
BJa3Kqygf92rlaZNRxJj09PmfEw6uaAqSZOyVEpvuyYr7vJ7paMpe8FSYK0jBVliMDoefQGv
+ntLWXoMfd92OfpsCFjKV8em7pTstSuUDo/hy7wi2tjlZVKrkDxtKhXWqI3Mv9D+b/BztS86
zP6fYQ+dUsGxbLqiORO1llNT9vmduZo+iFz82RvQtIXbq+DuHnvdA8w5BSu4VG7lNSkpW8qw
S5FfmbG42vTjfWd6ZgZ0ATGb1W+K3tSeT8m+Uzirvxb1SZ29u7wmBZVJjQIvU5aEWQHmmmgr
87q54DluGZoOCggcI0GV0FGr6EyaxUdFR7EzjkuV3LOQ8GrDupyzuOmzIu0a0hx69bsKzGS7
DVatzmVfbLNJ3WNnLo7pxADfAGo6yrFqK9qkBtNFyuXmPaDNazpwNWYcyNF9Ut7LEbkZnAo6
MPYxfEXXN7P/TokqwsAhSYZ1OSXNcgXYpGnSyzAqQ3knJRizs1eAXAbPuzGYkB8Oag9YcPKy
qDHDEIbv80SRFxSUl4RumbnSLdqEtlQ3oK4qFHEDzhkJKSTDsgVolqCkSrr+U3MvVyFCNQFL
5bwmO6kQIbTLRk4AI+QjZiLFkd2Z9IuRympjKsDNPTiDWjK2xJVbeXYOX/KuUcUd3wiktl2L
omp68+oeCsrFhsqhimnolm9mmLnJX+4zqq2oAo0nrh9P5z0KT+lYQNYh9peijpStts9UdJt2
HNysGdPBmHJ2JntcZeS2I5my4GQ9cqLJ8gtaqVr24lqKVggPrrOeKnh9SrSL+Y9YqtCY5pQW
Y1n0PVWi85rqMcKACxkWZCBlkKpRCCGXhywWmeFO2RaTri2NAf21NqbWBfOgLj2Np4SMpzST
SlQLSuqaSs80H+v8Otnt6ZYdcvBaGGQtgQqUleWHhG4LIxhHFqRXqzKb04nj2R+ZnnhO+7Ig
yrgBMitIsofBHuiKrZNS5uVpJAkbymMOyRz3+viz5DxnKkBrMGopk/t/OnJTK3nHXPn25e19
l64u85l6uGBzE4SDZWkjPw7AKjg02x9T8TZ1QbT0Hz0t5SQhGHZK2CCjcrQeBu2apocBG3tt
dhi+74EPmGM2KqoWwgPB3jjE2sXGSd83w9mxrVMLRIYyCtLadjDonThQDgDbFQ1BN2UXsqlr
iAYdjOajRp5t11EbKBGQMrLtTYougrgQ9Khs7ie0YJ9Widw4gLJ0GRXXKhbu48b9u/Tp4e1N
P9cyxk61njDjUTRfFWCvmfZBX+kH6pruXf++Y/3umw7SrH67/YCgDTsw5kpJsfvXz/fdvrwD
ETKSbPf94c/Z5Ovh6e1l96/b7vl2+3b79h+00JtU0un29IOZLX2HlE2Pz7++iJ4JIiW2Iovv
D789Pv+mh01lXJGlkfi+wWCg8kpqGIUWrWaBzaGXiVHw4aMEp0YRUvDRWc6FzqFmI1smNLKa
YPd2rMmMK7JOLXRC0BYYi2UUxyQ75piCvFBkkBW3a8qF3dqnh3c6J993x6eft1358OftdQlt
yFixSuh8fbsJQVgZsxXN2NTiuZ+Vfk1dbTOgMLa7GZvOKDY7xyg2O8coPugcl+E7onvFTCXg
t49s0k4Q6D3HfeZnQRYGetwdGEKoDV/FZ0JC2XmPrQKqtye6vRwUJe/PaJl5VYjXuBNITEHK
5Ed27s+DDCP5heSKWlLmx6aXT8YMrMrZ6U6G/gxTMbAsxzG3NBlYZOwUrEj9Hsy9S1W1Yhdq
k6+mOFgMPlYHuktRtR4itxxxxZv1rqCKwP5yNM9haZLefZdQxelS7LtE8hFl/WiuSdcVKliO
CMO3S5L3XNwfiqE/d0rfCwIuK4erDL2ndMo05V/YUA3KJMNmT386vj0oatKJUF2M/uL6lotj
vEB8KZiMtO9GOtx5h3SFjnRD7vJ7lXGTvkK5tv39z7fHr/SIwMQLzrbtSZAlddNy3SfNRU9H
JuJA8lwky+x5/bmimctkF8SLlY4NhtZIlTBRo1TMYIsXho6ZnDDUQRG/g5SSuUkhlgkJXgft
+Mhuzh0EO22fY32u6FHicADXJVHfnSQLy3belPg2295eH3/8fnul47Oqv6qsPAA3GUKCiNob
3R5Nne1GvnciepQMbYeEx+OWt7vLRuGAdBUBRepWyV43Q2k5TDtUtAdoiqNWu8/SjXrrvHdm
T3gdDB4DxhGbZpDbFJu6xVRfa9SVjimIlqakilyPzqu85Pf0uNo2pOhVsTypmxIIMhkqgmZm
MBWag/xXgYq7Cy+02avS7jDWet25DmpPTa0uWUqY6+0+74lO2NETPVGBFbi/TotKxZ0TMXLD
CtNcizlKuu6YWsz1dRXcq33jvx6wmwEGR/QFnC5JsTsziUQf/wWlTcOCyfWziIibRvyjqucZ
MJRjiKglEXEe+JhOnNePmnWgXD4Sc8MOVFR/XMbELaYiBMb5uPWMfENVXenAQ+7jtp30izex
rgseVkoh2z58CoScvZft5vj/KXuS5bZxYH9FldNM1eRF+3KYAwRSEkfczEWSfWEptuKo4lgu
Sa6ZvK9/aIAgsTTkvEscdTexo9Fo9LJ/ej5cO2/nA2SKOl0OTxCo8Nvx+f28RxRPuhKWyxw6
G6n5qL47FSC6PRl/sgAYRwCwxVGW9s4Q9dk7dlHGPA/sAncxFTz+w6VZ96YAaddS7iw/4gbc
o/LmVWqpcCbj5gpJuOsTwvlxnKwDYg4RYz1VZIo04mkJBeLcQCKpW6zAVvMStG54yGaB3vpz
Sly8Ed4DGnlQO1I/XruynOI+Vc0f+U+2E1KNbzZQil+VBV6IXphxoMCXVA+GA78rSrFktOKD
lTfI8zq7oNkWnvt9ukMFxeLX2+EzFZkA3l4O/x3OX7yD8quT/3u8Pn7HglCI0iExchoMeH9G
Zt5UZZj/vxWZLSQv18P5dX89dKLT0wELfiraAwFAwwJUcR81xVGitmqYfF3l26BQfTYjPftt
us3Aj9mPImw519gmzU3zGSOv5mFC8Wd/np23JI5Uz/At3OdsxT/P/CuS/7p131o5bjUXYHNv
RbHDh+N0kzZeGBb5DxDCPUQbw2pTwu1Dh5X5ipoQbxWM2UQYlPSOtUwHrfI7s0ER6ocf+VFe
BGooAwlpLoZ1qqSfp/Ov/Hp8/IHn5a4/KuOcLPwq8/MywlhqlKdZImZbqTJvIFZlH75bwOsP
vJu0xfFXFCO5fAurLGsDjptnoK2IQeWz2oJCIF7qLwkiH5ePmGXx7wkpeloOJgGNGWsbzYhV
HckH4+EI8+AW6G2/q6ePEI0EV+c+nmesJUCtAsUAZN0uxCQfGs30w96o3x1oFvUcwUPddK12
cDDGslvswC5J8w1sgDPVEL2BdnsmNKVkNhqYJdRQrkUxUAgoTAezodl5AI6slqWj0W5nPXc2
ODV6dwu0Os2AY7vo6ahrf15H3rE6N0IHYrST/dNnBpBj1BSco0UcIqNAEXfIAtJef5h39USU
oo4tJlpwVOYvIbxzktlL1+tP0VNedL8YjGbm6NUhiwxoRHuDydSkLSgZj7oTq9oipKNZD7Ve
F6WR3WQyntlbDRbxCEs5xLHrwuuPdW0Khwf5oLcIB70Zbmqp0hgm9QZ74c9KX1+Orz/+6P3J
j+psOed49s37K4R2RswUOn+01iR/alGy+BSADtQ5dfl9Tq2lHoW7TNWgc2CZq5d88TG89d+r
ahYx+gEbx7LdRdYQj2eYB12D7U+G1lf5Mhr0hvbDBIxNcT4+P9u8uX5RN48D+dAuww4ZK6fG
sht4vkpw6UMjZPI9LsFoVFGBKeU1kpXPpJ25ryrwNHwTDsrZZppisfE0EsIubpuguHfUgTDP
pp+1rQSfUT70x7cr5A+5dK5i/Ns1Gh+u344gXNYXic4fME3X/ZndM/7EZ4k/TuSBiJDj6B5h
E+Y8OyVVSmLVnlPDxX4hYjThFaTc3hszPdTHsL6qt+83lDIBIphDGGtc8RGwf+NgTmJsFWQF
BaVl22YASEGmKQKAK1okbMM6ymCYIlGlRwUoI1x9Ol8fu59UAiscEwDjTeTbbyAM0znKoI+a
IAjfsLv2AqpD9UgNAQSOMmvjCMNCSm1htpGPN415FDTFksgkMZnPRw++avvWYvzkYYbBd1M1
y42Ee3lvoAZy0+EVZcu1VE3SVbzOxHRMtfUwtYVCNNb17xKzuo+mozHuBCVp2OE2njleNRSa
6ayLcWGNQo05KBHZetqdYm3L8hEdoEnsJEWQh71+d2qXKRCqg4mBGWMV7hgGTxEkKVK6cPqM
aTTdMWbLoJEMxgOsERz38ddTZDVGw14x7WKFCswHq2R+N+iv7VJTEkaq8VWzhUALItykbcy0
21Ud15oppaNCNN1qYs6k/VkXfwmSNIsIojHc6ELGtp0aCVeBj/Rsa+oXaLxWSeBH7O6FbNls
M9DytbbwqZY1tenfKEKAHtv2U8mIwEf3JiOCaZyho8cxWCgXjcOgLIBjbo0AEAzRWjnm1qYH
ghkyH5ylqFEemtGbTbrYutkNnfM37qGuZhoXGSITJdgawiLY/uprGS2bL2g6mRkcDIlZBNO4
f336+Fzx8kF/gDRAwKvV1hB39QbeGne+OGcUKVtgmrJ1cyC9tVa9NEpcZ3E92f0pylgZZoQ6
wKoEI2TE4eCajqoFiYLw3lEyI7jJNDgJ5hypEEz6+gVVRQ0/Ln8ynX6wgSZDx97rD9EITA2B
calW4fj5kRfr3qQguHanZRfTYoqnn1FJBrd6BQQjRPaJ8mjcx7s7vxvit/dmdaYjiu1/WLQI
G5Fhgm3Mw318F6VygZ9eP8Nd5uZmBL+qWI/n3Bw7Bftf1+FN3raF4G8pLffoDXaoCkFSNDpd
m8tNBl07BSBc2fPD64Xd8dGueRGpDdrbAWphtqSu4DaWFltkH4iIHaybASsR8lGrhmdaAstD
0ILGfqg3okoUhxcSsnsSYStn6UXEaBEflSmaIWBbkV0ANNoNgMcONGxK5LUpWoJJbGXUEvCM
CAGDjrG9yENirwBdRctIuU63CKVrW94gw6amhraAnN1cxHfNuNKX4+H1qjFekt/HtCp2ThMZ
BkefLRh8Xi5sJwVeHhhbqd3PtxyOPwTWJSGjzxFVlGz8Kk6KYHFvTBxgZRI4NLOXIFn5RPer
UeH8uumjWUNUKlrPp0wooPe+WWXlrjWWrGErbwirqwXAEiE5DQLdljMlGQ9xnNZZwhqwSPzD
kX93DXCW8KEe6WDxKFBF7Iqv2c+kdSKvpGhwnz61wwJmnBClfh6yrbNAJ0slwbQOCl6+Xqh1
tz9rwhZQ6goK9pMtX8aXICFDdoevHEbjQSY8m0YtJSt1tQQwDSwssYJWVUp1NrfIj0sLuPFS
YgHnEKpYVVDWcCPGryw30juugGWCAsxnSFLrDWC/4NlSgYBxdxUkhWowJoBZEGusWUChm/YT
JcT9vJy+XTurX2+H8+dN5/n9cLliQUI/Im3rW2b+/bxEA/UUZGk0Ls2CPOrD+y6+LBPwb3ec
jWEY4F8x1HTSH8xxm5BsOun1SweqN5369jjlb4f9j/c3UCFeTi+HzuXtcHj8rsVQxSkUTin6
LiJOWxWQ16fz6fik5UKsQXYR84Q4fHrZWVixc3DSd6QBX+YVhFAFRoFtqjhgPDNPiaaK3gYh
JM7u8mdwtNSWAg0Utc4n4mLdTnowRANcgsNWVEzG6tNWC9PtmdMgpkUWsrmGtNe6fJAReGeQ
B+Ryf/lxuGLpJg1M28BdEIJ8wEYrWGBegovADz1uN6yrcFcRPLjC6s8rfAtABPPGcapqRax2
ipLQWwQ5GuADsjLQUNGzsB/gM8S40rpUgwQAobDK0ulXWzZFsfrQTV9Ojz86+en9/HiwpUD+
LqGJWwLCjqe5rzUjz6jF8bi3ELh5sMkqxkM8AwvagGa0SBDOE0VN1IxctFKYtpQBNdL6W6mu
bSW2JIpK6Vpq65UPP0/Xw9v59IiI+z64IZta4zq1ULVJS3YHYUi0m0i5or63n5dn9OKcMpFW
iIlL7jnAADjP4oTidMGr1qpQ2AmkydgGmW20nrNO/JH/ulwPPzvJa4d+P779CRzt8fjt+KjY
PwjW9fPl9MzAEEZb7YdkYwhafAcs8sn5mY0VaXnOp/3T4+mn6zsUL9zwdumXNrj33ekc3LkK
+YhUPDn9T7RzFWDhOPLuff/CmuZsO4pvzk4IY9ToiXbHl+Prf0ZBLfOCINobWqqCLfZFc3j9
1nwr/JtzrkXmY6KZvytoqx/y/7uyI1F6X1qmM4KY3bvIbKirn2uMw027xoL5/mCkqNVauPWm
XqOEStpdZFrEo96oaxWZFdPZRE0fXsPzaDRSNYE1WPrVKPyIcQ/1fUbcTavY1y3YArS/Iq1T
+0M8bukgw40GQCKbwSoEM1MjMxSg4bq7KLArEmCDu3zc7xK9RG6/MjAL4kKNETVHQXOTEK4l
E49mTKSHXNBIUIHsDs4LlbOzs1a5+zICcYRSNQezZMEFLYFCXfZWXc03KSTL0dNRCFeeIE1o
oXpcNPEAMh/8zRi0zRbSHA23MfOMRnkxh19Uj0sl8EKNsNziHJ6TQPhLbiBhsWsmF3Xy968X
voHbwZRZNTSxSQHWSdulO1dNMKdRtU5iwh3fgAxtEnxea72qIskyP8YESpXKrEfF5YGfoa/p
GhEJN8p2AhSs3yDaTaM7aK2Og9RGId5FQKc7UvWnccT99Rw1NzQwFEbpJOWeEVXkReOxarQG
2IT6IbuKs/XkqfozQPEDXfgJOhHqggeUEGftLhYM0uv3tMzr+lpQ+gwOp4aaUTImqpTLfrA9
rj+LEzuohXpfkbsk9rLEjDfnvMt4BNNm8rf+tjH8p8nqamAasf3gqUF66qRllQ8iWuMRsdp2
ruf9I7i5W+wmL9QsM0Ukcruwe36ux9ZqUawtFbbSgUJmZVJATMTK2NKlwjkQxSGmNoIZFJqF
qIRVRuw/myD/iCDK8ctvQ5AW+I27IUDMlGWkF3u0mzsTu3haInuaVYHpRGihDFdCngQkWmYN
Ya4Hrm3wTTYRDMnuXcOuaTbdYCEx0C5xhT7mZGYq17o1TCryH+xEr3VbUjBeokmZamcELy/z
l4H+ZpcsVIyrHd4iNEpikIosSl2xjRqOg+sHa8qON0ZohBQnAMzKutxVxFtOZn2MXdfYvDdU
DSsAaohCDNJcFqV+Cam4YXZRlaRqvOxAvejBLzjIjUryMIj0450BBJsFxYG5uTIqEhZjuk8I
kabb5zGpqboriWdkSGjHyQq9IPXLuiDMx3ZxBIUR59iKaFxnjfMr8MIjmWbxyEDsGqsGvWFi
Z7/S3aNqULUjRYF5kTH8QHOKrgEVeCOxiaShURpH5j4tM8O2rCUZmgUObxU4/J0CDbGWw9Zl
HBRmStl/5p72cgi/bVbVjmA0p2yXK3s08wM2yuBSlyNARkq1IHsNhmcnDOIFrh1TSnVOxT9G
pf8Yg6aA5XBpPV3kzo7ybyC9LnhHaOtjxytFPlkucnMtQYbFfuVwspsXmauoOAibwuTI92Vn
293UrxuJF1J/IUbPKggbKInCBovj+GS6+iO+5hamQfyPT82QmgZhzj34IFSHi+6BSYquEcI7
IBIn63tJQISfCuOH6pAGoV8BOFCDIUZMIgND+HsHHlyAY5rdp0WgPmpoYHaqLfWpyiEoA75d
F3nzmCelPBMQCIBhwL0gJt1dmRTE+Akms1wQ5uwa0iRqQj04WNaEW5LFrKvoXAgKt6PV3SIq
qg0eBl3gMCMEXiot1EtjWSSLXOeHAqbvBshCqe8GakQyleeBeD9SP07YVITk3tyrDRQimAYZ
W8CVhwYgxihJuCVMyF2wa2yydRQbxJ6PPzAoRJHPRiRJtYUiRIn943ctYXcu+bCyyjiI8wTH
Hq0pINtisswIrhuVVO7plhTJHDZ6BWHzMAkAaHigEW2iGuiNChQiR1ulIlwMixgi7zO7wnzx
Nh4XDizZIMiTGbt26mdGEgZqEIYHRqSFPPEWcqHIGvFahBVAkn9ZkOKLv4N/2e0ebceCs2yF
5eTsOw2yMUngt7Tfh8DrKTxWDwcTDB8k8JoMoSU+HS+n6XQ0+9xTnrVV0rJYYD5nvPmGTOKo
4f36baoUHhcWx26FuFuDI1Qyl8P706nzDRu0NpmxwrwYaA13HUwVAUhQ/ajshQNh7CDcYmC4
O3EkXQWhl/nYvWHtZ7GWTVm/YRdRqjePA9pjCl3ngsYl4LAr+6IOQq6+G/E/rTggdRj24KmP
SrkwQxHmHajQ4RfbJFurVIr6wGDA8HvTN35rCk4BMTuuIod//9TJ863DoEuQV/jxwgNMuiIZ
iHZzbuLEw1lSP/t5MToyNREsAHaVZ0R6x2V80NJLleCrah2Y0whjadSHwKWBmm8Y5A3zJwyV
VqHp3ZiXcZZS83e1zHN1iGvoDabrpytc3KLBQisKfotjBjvWORasPrbszOPCpBxg7RwAqq1P
1lW6BT0xrn/hVGUKof3deNf+4UjL6K6F4rFLWjwop1IITo8vLkH4G+27tQIZNycukZogzLRG
zVLH1UG1+mM/JM/GzwIgkMdJxY4TvMCWxMiBo+MmuNWuRjQd4TadBhE+MQYRZiprkEz0sWgx
qsuugek5MX1n36cOhx6DCLN1NEhGN+rAzYcNotnHRLMBlpVLJxm5Bmg2cA/DbPgbtU8nrmFg
ohes0GrqrKDX/531w6gw03eg4YaGZvGyXtdHEt/Xh0SCB67yPurnCC9vjIOtnScRmKW91q0B
XqAaTUCDG+1aJ8G0yhBYqcPACJdJxiQ2G8qtc/2wQJ+MWgJ2Py2zBP04S0gREEwoa0jusyAM
1TcgiVkSP9QfJhpM5qOPrxIfUIgA6tlFBnEZFFiJvPu3G1qU2TpQLUEBAXK4Wp4XokGA4oBq
WR9qQBVDbvAweOBpTBoTYFU41JSlwlrl8Ph+Pl5/2SbLeroc+MXuuXclxAs1VH911HU2c0AG
FpTKh/O2qFZ7KVQkvuc+VBmi8lZVwsrm3cGppIoKDF5z/tZbZAHFnb0xVamFRA9TbhHGbjqe
H7Mmg/YFruZctKFmsASLDL84M9kQNDniGQtvEagdKS8GQgCt/DBFw5nJy1g7FKq5e5hHf38C
I7Gn07+vf/3a/9z/9XLaP70dX/+67L8dWDnHp7/AFfgZFsFfX9++fRLrYn04vx5eOt/356fD
K7xItetDifHSOb4er8f9y/F/eYAp5Y4NKmbWBbpmqzLW1BMcxZVjIeQ1brzRHa9mghgehpy0
8hEEb5JEu3vUWPKYe0H2ZpdkQnOoqqO4Sb/x+MZh7LpG03sTulMj8gpQemdCMhJ4Y7aMaaJE
meV7JZFvTPT86+166jxCyPLTufP98PLG46FqxKB5JOrLnQbu23CfeCjQJs3XNEi18JkGwv5k
pZm8K0CbNFN1rC0MJWxkWqvhzpYQV+PXaWpTr9VnM1kCqKttUsbvmchhl1vDNVmpRsHOxi4r
2ofNpdJ4rqmplotefxqVoYWIyxAH2k3nf5DZL4sV49NIw1HHl/T968vx8fOPw6/OI1+hz+f9
2/df6vOnnLkce/2skZ69UHxKERhKmHk5sftXZhu/PxrxtLDC/uL9+v3wej0+7q+Hp47/yhvM
Nnzn3+P1e4dcLqfHI0d5++ve2lqURuwObMyDGnFR0q3YKUn63TQJ73sie7A5FMRfBuC76R6P
3L8LNsiXPiua8caNNQ9zbhEMAfIvdsvn9kjSxdyGFfZCpsjq86n9bZhtkeYmC4eHgkCnrGXu
MdghVTPxYJsRe3vGK2W4jcGGFDlFaU8UvD1t5NpY7S/fXcOnOZJJNoYBd2KkzW5uGK01Yd7x
+XC52pVldNBHpgvAdn27lRETrUbMQ7L2+3P32AoCe3xZPUWvqyXDlksd5eY3FrlEcdPDGwzP
G1rbKvLsaYwCtvS5cRo2xFnk9RwB1hSKMebV2OL7o7FVLQMPVE9YuT9XpIcBsSIYeNRDDtQV
GdjACIEVTAiaJ/YBWSyz3gw7YrYpq9B+QuJxt+31TXx7HTBYVSByRFzO9XCoEpFRPGtzs96S
remgYdJAeCB2h8MdLxuavMD1TAoBpt6Q54yPtX7B/94qdr0iDwR3H5KzRMKccX131fJcsOfX
9+1jmAkJqYilZC6Qob0OfIJ0qtgm5oiLZXD6+XY+XC5Cbje/YrJVSNCoupLRPyRWA6ZDe3mH
D3ZDGWyF7d6HvLBjNmb716fTz078/vPr4dxZHl4PZ+Oy0SxKiCybYiKkl82Xhq+iilkZnswa
zqmSVogornduKax6/wkgRJUPJs/qXUGRDSuim9cZKKthDjKnvN5QYAPWINGbAVTNbXaMS8nL
8et5z65g59P79fiKHKFhMEfZDIcz1mGdAICozyhpfY1+7DrHACc23M3PBQmOasRHpQRzUnTC
G5smmFeeo//NOZnlwYPf5tPASG71xSkAtR3VhFKbyHF+rbb27vE3tZtEgAgrLRaT4Vss1Ncd
2sMPFEG0LCAoNC7fAIXtvGXTQFDbHfVDRxGUspP15iaHtkY8w3C13GFPmez+HkU+aJ+46goi
OGuXe4lMy3lY0+TlXCfbjbqzivqgGgooGC+alovpmuZTMNbZABbKaCja52tGM5GO7DXe5v2H
8xXck9gt58JDVV6Oz6/76/v50Hn8fnj8cXx9VmMXwCtwVUC6UqGyyzRTKBufaw70Nd7fFRlR
u4eMYu6z/3gku/+wNrbhIYpiXvwGBWdXPKcjb5Y04PiNMRCRKZ1cTahrVDWOhFRzdndmx0qm
+I+C0zrJGEm81BwbiGFaNg+YoAdu+MrSkJ4nMaQNKAL1dY8mmac5PWRBxFPuzLWQmUKNqnrm
NN4sNDANYiXKALNbAdsrwf9VdnS9cduwv9LHPWxFsxZtMWAPPtuX8862HH/kkrwcsvQWBG3S
ILkM3X79SEq2SYlyu7c7kdY3KZIiqV6II+nJe4kRKg5QUT/s5VdvPYEVCiaTdYQUCQWoJ19d
6iozQ3in1J60uyTyEq7FgJnX630vZJhU/vvAl3gVKm4pc+eeNLVpVerMVGzoMwiEqck3Upai
E7xffoWMG47kUviIgJCm1IGlWh0glqnYIKzp5WotF1dYzKffluwvIomPHJiCbBrNDuAQioQv
gytM5Auac2m/AQpYag9D9RdaW6V/BI3JBZoHvz+9KhTq4RcE43qDjL/vTGmE4wYvxWo5Ra14
wv6k60xaACWf5zDGViRUScitnUcA2SJKnyLIGMtF7pwa26c0O0lDFw/87Brj9xC+a4seI3Kq
VZB0CLpdJi0CNyTXKjWQiRtx16Yd85jq7cCsNkpNCKpNPQL2zs/xsk7jOJUYOkJTlv7n8Nf1
y5cjJp443t2+4BuG9/YW4frpcA0nwr+H35gQW2EekSvy1sF7SnS+O3nDmMgI79A+gfmUVXsH
x2I1/ROrqNCvRiSSGhGGKElZnNYVTuNHdrGIAAzui/i9d6el3b1s5s740VEa8Z4z/le597jB
Sul9PlFIb6pCctfyat8nzK6IQasgrbLGq6YQWXbhzzpju8TgC/JoWe1bQR9AM2O751lnwt6c
5j1maDDrjBPW2sAuCh7TptKP3zilUhE98JyXecpwO4wgNGwEdDGW5Y3hSHD4iK2KV5n1qXqN
G0gk/khIn+o2ZVa8DYfpgG0UWC4B06rJ+A0Shw0TUN4hjgIllT4+3T0cP1Oixk/3h+fb8OaZ
vNG3lC1DSLa2GH2s9JsTGyi4BzG9BPmpnO6HPkQxzgb0+n037SwnNQc1vJt7QXmiXFfoBW+V
OMcXx+NedgJj73uvMuG5WhnUGPK2hQ/0p2CiUzoZeu6+HH453t070faZUG9s+VO4ALZPTsEP
ytDdfUhz8awRg46HYuQhb4bZNWWhy3oMKdsl7Vq3KZ5mwHTStmgibu55TVdn1YAuCxizomya
dQuTSjEPwMp/ZeuM5NcAnWAIbRXJhZQnGbUAWJrbAIBBBEfnxz7hDMyOrrOxMeiTWyXiWR4f
Qt3zXjd2r3IajIK13pM2bzxnEz+88DbTD1rW7m5Gqs0Of77c0gPXxcPz8enl3uXIG0klQV0Y
VK2WaT+scLqst4vw+5tvJ/PEcbzweTA5ws5j4SQnbGHp+fbD/5pSPsoUw6pLalAA6qLHE1Os
BsF4ZRYZlFUt3tsCV5j9pfPqIO9qv8xr02tkOpx1r3D0tSFElep/aMHkbFrX5ZBwseeBkcD5
U0z1MgaNTBL0+bzuRPSTrQyhvvAgASNlBhf4VLHZ1cLoQXYMU3SmFmqyLAeZz861TFYgcfC1
vuhOs0Esnd9pV6woaBKOHioxGOV9itaM7vbhkozQNh2IkyzwyREVhclmGCNuvzdQfxFOPPZU
cimMSM/tIdAxSuA4YZdHSLRl6xA0dJ642wFzzhwwr7Mor7aVnFf+RJ5XdLUqndImULtSCptT
0JRlcJ6jBEo0Q35HMU8wNhaM2Fp7oV4KWBNWyKa53ybIBkJzroXizrB7e2YjWSbVbVsDNff7
SeAMNRNv0MGNlxzSKUSA/8p8fXz++VX59ebzy6M9MjbXD7dcQsO3OdAvy4hQSlGMMdhDPm8r
CyQBe2ApO9GtamigUz1sSq4qd2bdR4EohYH+nlQcrZEvhsRxpq6xOcEW9psBZrtPIg/B7M7g
JIbzODO6SEf82rajMuzlybXumHBMf3qhh9JCtmvpJAhkoGIl2G/0alOq9DcDrso2zxsv7tOa
P9GhZD5cfnp+vHtAJxMYxP3L8fDtAD8Ox5vXr1/zF2HM+AIdJV1UwmGaFhPYurhahUCoBhyV
T71ozRj6/CIPGCpLzydpWkff7SwEWJ3ZNYlMGeLa2nV6lJQFUx+9o45CdfImrMsBopVZXRg6
k8e+xpmkKz0tue+ET50CYukx3iaij89D17TL/7HgQqPt24RbdEhqhdnBRwXzPIOta62dysFh
j6SFI85hgMgNB0wXJt2zpPXZSkKfro/Xr1AEukFrfqDX0E2AL5q4Qp9JRnQ3AlLYdeGly531
RDxp632W9Alqd+3QhJHwgi9EOi/7mYLuBeIiSMzdqGWDgKAxC74D+MBQngBBYR3bGghf+pYW
WVeHAJqfqeG8YzJF0VWPGs+cNtPOeoxAsKH7IHWi6TDynlcCIml62RuNyujsHl88tsNgB4qE
noLwv9FxRr197e12WwEV7isSwciPt808FIxFRaIgTBBN697XcFL3oa1lBuIXEWa6jq9Kl+B7
rWESqvs7OH20fUMjANmABKTQ8JUnbXnpDCDSZmmzMsOpq4fAjdw5tvF4tLkMafW6ym1L/eH5
iEwKj9H069+Hp+vbAwthwEwnTFSixCdzA6JYyva2LL+gyVNhtIbOKXcOAHEsAa01ptUTYIxL
JlNkMDNiUpRS+MYSq8p4Zw0BqmSbj5EZHqgwk7zFNwuC1sj+v98tRQu3jVap1qb8dj4UMJq4
56Q0aeZb6epu5V6QaKHYbUWZTw3xNa4FlILXnrgiNlF0LVhIuc16PcuBFdrwmrgzkUeKCaUq
akp6H8eIfr+apgGP22D/zwx0hR5+C3B+TRTFogQfIODulytzymIUPprmly9ledhCFIlmZ5Nf
YBjtwvRZe7cNdNFkrhGrs9EV8ustAHqj7WgCE7/imZixcLK4y6qgmFJUL9hkBj9VH4de0M1c
HK5phRKjxUviHrXzhfmM+aURtMh090m727cLpACjN40u0hAcNG1kQguTg65j0cgn20ajv6Ng
gei3sTFkmThX0dZFnWE/ZyeL2LKvi7YCMTQP1thmhNBOIQKoZ4L1NlEBzLEjEJrspMSvCty2
pmivaDic3eOVWdh2GHaUwE6PUw45mhRh5+DLiL0DIL52sHjwBrFW9ubnP9yDlAlVCAIA

--/04w6evG8XlLl3ft--
